json.extract! attendance_request, :id, :user_id, :status, :attendance_id, :created_at, :updated_at
json.url attendance_request_url(attendance_request, format: :json)
