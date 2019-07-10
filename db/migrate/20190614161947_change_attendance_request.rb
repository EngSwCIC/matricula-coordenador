class ChangeAttendanceRequest < ActiveRecord::Migration[5.2]
  def change

    drop_table :attendance_requests
    def up
      connection.execute 'drop table if exists attendance_requests'
    end

    create_table :attendance_requests do |t|
      t.references :user, foreign_key: true
      t.string :status, default: 'aguardando' , comment: 'status são : [ aguardando, atendido ]'
      t.string :description

      t.timestamps
    end
  end
end
