class CoffeeBean < ApplicationRecord
  belongs_to :user

  # presenceはnilや空文字を拒否する
  validates :name, presence: true

  # roast_levelは1〜5の整数のみ許可する
  validates :roast_level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true
end