class Framework < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_one_attached :icon, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :language_id
  validates :icon, presence: true
end
