class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.integer :team_size

      t.timestamps null: false
    end
  end
end
