class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :author, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
