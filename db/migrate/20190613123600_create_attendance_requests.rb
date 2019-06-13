class CreateAttendanceRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_requests do |t|
      t.references :user, foreign_key: true
      t.string :status, default: 'pendding' , :comment 'stauts are : pendding, appontiment ok, appontiment removed'
      t.references :attendance, foreign_key: true, default: nil

      t.timestamps
    end
  end
end
