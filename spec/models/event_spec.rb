require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Association tests' do
    it { should belong_to(:user) }
  end

  context 'validation tests' do
    it 'should ensure date presence' do
      event = Event.new(name: 'Birthday', location: 'Lagos', active: true, cost_type: 'free').save
      expect(event).to eql(false)
    end

    it 'ensures name of event uniqueness' do
      freezed_time = Time.utc(2022, 1, 1, 12, 0, 0)
      Event.new(name: 'Birthday', location: 'Lagos', active: true, event_date: freezed_time, cost_type: 'free').save
      second_event = Event.new(name: 'Birthday', location: 'Lagos', event_date: freezed_time, active: true, cost_type: 'free').save
      expect(second_event).to eql(false)
    end
  end

  it { should validate_presence_of(:name) }

  it {
    should validate_presence_of(:location)
    should validate_presence_of(:description)
  }
end
