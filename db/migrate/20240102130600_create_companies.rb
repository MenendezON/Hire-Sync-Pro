class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :email
      t.string :phone_number
      t.string :website
      t.string :industry
      t.date :establishment_date
      t.decimal :revenue
      t.string :logo_url

      t.timestamps
    end
  end
end
