class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :slug
      t.string :title
      t.string :location
      t.date :deadline
      t.text :summary, null: false, default: "Not available."
      t.text :duties, null: false, default: "Not available."
      t.text :qualifications, null: false, default: "Not available."
      t.text :extrat, null: false, default: "Not available."
      t.boolean :available, null: false, default: true
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end