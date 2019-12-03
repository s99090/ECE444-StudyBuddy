require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid profile' do
    profile = Profile.new
    profile.user = User.new(username: 'abc', email: 'abc@abc.com', password: '123123', password_confirmation: '123123')
    assert profile.valid?
  end
  
  test 'invalid profile' do
    profile = Profile.new
    refute profile.valid?
  end

end
