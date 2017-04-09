class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups_users, id: false do |t|
      t.references :user, null: false
      t.references :group, null: false
    end

    # Add an unique index for better join speed!
    add_index(:groups_users, [:user_id, :group_id], :unique => true)
  end

  def self.down
    drop_table :groups_users
  end
end

