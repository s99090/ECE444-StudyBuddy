require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'valid event' do
    event = Event.new(name: "event1", event_type: "meeting")
    event.group = Group.new(name: "group1")
    assert event.valid?
  end

  test 'invalid event' do
    event = Event.new(name: "event1", event_type: "meeting")
    refute event.valid?
    event.group = Group.new(name: "group1")
    assert event.valid?
  end

end
