class Event < ApplicationRecord
  belongs_to :user

  def self.upcoming_events
    all.filter { |e| e.event_date > Time.now }
  end

  def self.previous_events
    all.filter { |e| e.event_date < Time.now }
  end

  validates :name, uniqueness: true, presence:true
  validates :description, presence: true
  validates :event_date, presence: true
  validates :location, presence: true
  validates :cost_type, presence: true
  validates :active, presence: true

  scope :future_events, ->(date) { where('event_date > ?', date) }
  scope :past_events, ->(date) { where('event_date < ?', date) }
end
