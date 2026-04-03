class AddCuppingScoresToCoffeeBeans < ActiveRecord::Migration[7.2]
  def change
    add_column :coffee_beans, :flavor, :decimal
    add_column :coffee_beans, :aftertaste, :decimal
    add_column :coffee_beans, :acidity, :decimal
    add_column :coffee_beans, :sweetness, :decimal
    add_column :coffee_beans, :mouthfeel, :decimal
    add_column :coffee_beans, :acidity_ripeness, :decimal
    add_column :coffee_beans, :acidity_complexity, :decimal
    add_column :coffee_beans, :thickness, :decimal
    add_column :coffee_beans, :roughness, :decimal
    add_column :coffee_beans, :dryness, :decimal
    add_column :coffee_beans, :astringency, :decimal
    add_column :coffee_beans, :harshness, :decimal
  end
end
