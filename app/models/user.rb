class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coffee_beans, dependent: :destroy
  has_many :brew_notes, dependent: :destroy
  has_many :cafe_shops, dependent: :destroy
end