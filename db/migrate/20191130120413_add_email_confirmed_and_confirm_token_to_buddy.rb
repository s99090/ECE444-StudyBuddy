class AddEmailConfirmedAndConfirmTokenToBuddy < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :email_confirmed, :boolean, :default => false
    add_column :buddies, :confirm_token, :string
  end
end
