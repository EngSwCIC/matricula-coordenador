# frozen_string_literal: true

json.extract! attendance, :id, :name_student, :course_student, :comment, :priority_student, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
