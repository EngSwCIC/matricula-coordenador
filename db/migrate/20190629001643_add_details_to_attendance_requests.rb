class AddDetailsToAttendanceRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :attendance_requests, :details, :string
  end
end
