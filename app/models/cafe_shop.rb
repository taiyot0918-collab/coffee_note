class CafeShop < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  # visit_dateは未来の日付を拒否する
  validates :visit_date, comparison: {
    less_than_or_equal_to: -> { Date.today }
  }, allow_nil: true

  # ratingは1〜5の整数のみ許可
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true
end