class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key:  { on_delete: :cascade, on_update: :cascade }
      t.references :post, foreign_key:  { on_delete: :cascade, on_update: :cascade }
      t.text :text
      t.timestamps
    end
  end
end
