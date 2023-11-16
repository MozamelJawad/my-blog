class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :post, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.timestamps
    end
  end
end
