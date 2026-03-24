class CreateCoffeeBeans < ActiveRecord::Migration[7.2]
  def change
    create_table :coffee_beans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :origin
      t.string :variety
      t.string :process
      t.integer :roast_level

      t.timestamps
    end
  end
end
