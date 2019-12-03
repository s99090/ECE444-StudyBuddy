require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid professor" do
    professor = Professor.new(name: "123")
    assert professor.valid?
  end

  test "invalid professor" do
    professor = Professor.new()
    refute professor.valid?
  end

end
