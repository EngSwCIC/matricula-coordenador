module RemindersHelper
  def attendance_user_name attendance
    if !attendance.blank?
      "#{attendance.id.to_s} - #{attendance.user.name}"
    end
  end
end
