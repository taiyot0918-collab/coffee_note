class CreateBrewNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :brew_notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coffee_bean, null: false, foreign_key: true
      t.string :tool
      t.decimal :dose
      t.decimal :water_amount
      t.integer :water_temp
      t.integer :brew_time
      t.text :taste_memo
      t.integer :rating

      t.timestamps
    end
  end
end
