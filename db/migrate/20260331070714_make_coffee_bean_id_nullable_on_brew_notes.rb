class MakeCoffeeBeanIdNullableOnBrewNotes < ActiveRecord::Migration[7.0]
  def change
    # coffee_bean_idのNOT NULL制約を外す
    change_column_null :brew_notes, :coffee_bean_id, true
  end
end