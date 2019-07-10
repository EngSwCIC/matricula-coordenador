class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.text :remind
      t.datetime :remind_date
      t.boolean :read
      t.references :user, foreign_key: true
      t.references :attendance_request, foreign_key: true

      t.timestamps
    end
  end
end
