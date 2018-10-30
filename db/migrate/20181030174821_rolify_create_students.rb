class RolifyCreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table(:students) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_students, :id => false) do |t|
      t.references :user
      t.references :student
    end
    
    add_index(:students, [ :name, :resource_type, :resource_id ])
    add_index(:users_students, [ :user_id, :student_id ])
  end
end
