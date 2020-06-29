class User < ApplicationRecord
  has_many :languages, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
