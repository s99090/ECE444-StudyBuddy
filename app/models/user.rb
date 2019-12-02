class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_one :profile, dependent: :destroy
  has_many :notes
  has_and_belongs_to_many :groups
  validates :username, uniqueness: true, presence: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    i = 0
    username = 'account#' + i.to_s
    loop do
      i += 1
      username = 'account#' + i.to_s
      break unless User.exists?(:username => username)
    end
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.username = username
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
      if user.save
        @profile = user.build_profile
        @profile.fname = auth.info.name.split[0]
        @profile.lname = auth.info.name.split[-1]
        # image = open(auth.info.image) # assuming the user model has an image
        # @profile.avatar.attach(io: image, filename: 'profile-image.jpg')
        @profile.avatar.attach(io: File.open("#{Rails.root}/app/assets/images/default_profile.png"), filename: 'default_profile.png')
        @profile.save
      end
    end
  end
end
