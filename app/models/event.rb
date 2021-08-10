class Event < ApplicationRecord
  belongs_to :user

  def self.upcoming_events
    all.filter { |e| e.event_date > Time.now }
  end

  def self.previous_events
    all.filter { |e| e.event_date < Time.now }
  end

  scope :future_events, ->(date) { where('event_date > ?', date) }
  scope :past_events, ->(date) { where('event_date < ?', date) }
end
