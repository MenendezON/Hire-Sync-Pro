class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :institution
      t.string :degree
      t.string :field_study
      t.string :location
      t.string :graduation_date
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
