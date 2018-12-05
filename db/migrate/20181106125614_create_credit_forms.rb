# frozen_string_literal: true

class CreateCreditForms < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_forms do |t|
      t.belongs_to :user
      t.integer    :requisition_number
      t.string     :sei
      t.date       :received_at
      # t.integer :funcionario_id
      t.timestamps
    end

    create_table :credit_items do |t|
      t.belongs_to :credit_form, index: true
      t.string     :description
      t.integer    :group
      t.integer    :workload
      t.integer    :requested_credits_amount
      t.timestamps
    end
  end
end
