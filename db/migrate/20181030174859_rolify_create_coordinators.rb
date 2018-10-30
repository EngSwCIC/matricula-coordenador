class RolifyCreateCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table(:coordinators) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_coordinators, :id => false) do |t|
      t.references :user
      t.references :coordinator
    end
    
    add_index(:coordinators, [ :name, :resource_type, :resource_id ])
    add_index(:users_coordinators, [ :user_id, :coordinator_id ])
  end
end
