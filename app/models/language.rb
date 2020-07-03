class Language < ApplicationRecord
  has_one_attached :icon, dependent: :destroy
  has_many :frameworks, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
  validates :icon, presence: true
  belongs_to :user
  scope :user_langs, ->(user) { where('user_id = :user_id', user_id: user.id) }
  scope :where_not_others_ordered, -> { where("name != 'others'").order(name: :asc) }
  scope :where_not_others, -> { where("name != 'others'") }
  #   scope :order_by_hours, -> (languages)
end
