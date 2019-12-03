require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid user' do
    user = User.new(username: 'abc', email: 'abc@abc.com', password: '123123', password_confirmation: '123123')
    assert user.valid?
  end

  test 'invalid user' do
    user = User.new(username: 'abc', email: 'abc@abc.com', password: '123123', password_confirmation: '1231231')
    refute user.valid?
  end

end
