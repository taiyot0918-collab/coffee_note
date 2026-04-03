class CafeShop < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  # 未来の日付を弾くバリデーション
  validate :visit_date_cannot_be_in_the_future

  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true

  private

  def visit_date_cannot_be_in_the_future
    # visit_dateが入力されていて、かつ未来の日付の場合エラーを追加
    if visit_date.present? && visit_date > Date.today
      errors.add(:visit_date, "は未来の日付には設定できません")
    end
  end
end