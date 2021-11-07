class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user , null: false
      t.string :name
      t.date :birthday
      t.string :department
      t.text :introduction
      t.timestamps
    end
  end
end
