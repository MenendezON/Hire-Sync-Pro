class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.boolean :is_avalaible, default: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
