class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :company
      t.string :location
      t.boolean :current
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
