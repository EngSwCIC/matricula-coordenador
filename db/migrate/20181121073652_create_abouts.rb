# frozen_string_literal: true

class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.text :description

      t.timestamps
    end
  end
end
