class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.belongs_to :likeable, polymorphic: true
      t.belongs_to :user
      t.timestamps
    end

    add_index :likes, [ :user_id, :likeable_id, :likeable_type ], unique: true
  end
end
