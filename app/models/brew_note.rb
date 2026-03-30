class BrewNote < ApplicationRecord
  belongs_to :user
  # coffee_beanはoptional: trueにすることで豆なしでも登録できるようにする
  belongs_to :coffee_bean, optional: true

  validates :tool, presence: true

  # 豆量・湯量・湯温・抽出時間は0より大きい数値のみ許可
  validates :dose, numericality: { greater_than: 0 }, allow_nil: true
  validates :water_amount, numericality: { greater_than: 0 }, allow_nil: true
  validates :water_temp, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than_or_equal_to: 100
  }, allow_nil: true
  validates :brew_time, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil: true

  # ratingは1〜5の整数のみ許可
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true
end