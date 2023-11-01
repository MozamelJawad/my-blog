class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :text
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
