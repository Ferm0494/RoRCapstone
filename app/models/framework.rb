class Framework < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_one_attached :icon, dependent: :destroy
end
