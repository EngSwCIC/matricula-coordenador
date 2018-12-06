# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :name_student
      t.string :course_student
      t.text :comment
      t.string :priority_student

      t.timestamps
    end
  end
end
