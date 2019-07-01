json.extract! reminder, :id, :remind, :remind_date, :read, :user_id, :attendance_request_id, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
