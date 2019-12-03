require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid group' do
    group = Group.new(name: "group1")
    assert group.valid?
  end

  test 'invalid group' do
    group = Group.new
    refute group.valid?
  end

end
