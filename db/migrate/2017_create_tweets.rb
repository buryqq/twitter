class CreateTweets < ActiveRecord::Migration
 def change
  create_table :tweets do |t|
      t.string :title
      t.text :kontent
      t.integer :rejting
      t.timestamps
    end
  end
end

