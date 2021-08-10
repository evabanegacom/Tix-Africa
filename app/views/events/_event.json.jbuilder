json.extract! event, :id, :name, :description, :location, :event_date, :type, :active, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
