class Language < ApplicationRecord
    has_one_attached :icon, dependent: :destroy
    validates :name , uniqueness: true, presence: true
    validates :icon , presence: true
    belongs_to :user
end
