class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users, on_delete: :cascade, on_update: :cascade }
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps
    end
  end
end
