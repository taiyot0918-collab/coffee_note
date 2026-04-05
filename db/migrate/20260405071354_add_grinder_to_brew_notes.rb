class AddGrinderToBrewNotes < ActiveRecord::Migration[7.2]
  def change
    add_column :brew_notes, :grinder, :string
    add_column :brew_notes, :grind_size, :decimal
  end
end
