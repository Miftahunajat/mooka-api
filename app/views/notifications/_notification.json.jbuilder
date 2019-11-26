json.extract! notification, :id, :type, :judul, :text, :user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
