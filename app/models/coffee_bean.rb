class CoffeeBean < ApplicationRecord
  belongs_to :user

  # dependent: :destroyでこの豆に紐づく抽出ノートも一緒に削除される
  has_many :brew_notes, dependent: :nullify

  validates :name, presence: true

  validates :roast_level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true

  # カッピングスコアは0〜5の範囲のみ許可
  %i[flavor aftertaste acidity sweetness mouthfeel
     acidity_ripeness acidity_complexity
     thickness roughness dryness astringency harshness].each do |attr|
    validates attr, numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    }, allow_nil: true
  end
end