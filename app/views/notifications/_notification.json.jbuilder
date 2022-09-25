json.extract! notification, :id, :name, :user_id, :date, :created_at, :updated_at
json.url notification_url(notification, format: :json)
