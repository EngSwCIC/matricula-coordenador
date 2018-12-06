# frozen_string_literal: true

class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notices, :text
    add_column :users, :office_hours, :string
  end
end
