class BrewNote < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_bean
end
