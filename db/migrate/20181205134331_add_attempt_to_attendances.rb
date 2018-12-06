# frozen_string_literal: true

class AddAttemptToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :attempt, :boolean
  end
end
