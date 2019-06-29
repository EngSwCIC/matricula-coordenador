class AddPriorityStudentToAttendanceRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_requests, :priority_student, :string, default: 'normal' , comment: 'prioridades são : [ normal, em condição, outros ]'
  end
end
