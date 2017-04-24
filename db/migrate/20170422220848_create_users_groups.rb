class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.name
      t.belongs_to :user
      t.belongs_to :group
      t.timestamps
    end
  end
end
