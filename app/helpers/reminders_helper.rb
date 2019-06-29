module RemindersHelper
  def attendance_user_name attendance
    "#{attendance.id.to_s} - #{attendance.user.name}"
  end
end
