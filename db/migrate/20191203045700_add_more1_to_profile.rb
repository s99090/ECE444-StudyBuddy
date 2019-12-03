class AddMore1ToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :about, :text
    add_column :profiles, :phone, :string
    add_column :profiles, :website, :string
    add_column :profiles, :address, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :major, :string
  end
end
