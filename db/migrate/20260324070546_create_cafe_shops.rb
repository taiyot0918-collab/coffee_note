class CreateCafeShops < ActiveRecord::Migration[7.2]
  def change
    create_table :cafe_shops do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.date :visit_date
      t.text :memo
      t.integer :rating

      t.timestamps
    end
  end
end
