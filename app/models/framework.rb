class Framework < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_one_attached :icon, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :language_id
  validates :icon, presence: true
  scope :user_language, lambda { |current_user, language|
                          where('user_id=  :user AND  language_id =  :language',
                                user: current_user,
                                language: language)
                        }
  scope :user_frameworks, ->(current_user) { where(user_id: current_user) }
  scope :order_updated_desc, -> { order(updated_at: :desc) }
  scope :order_total_hours_desc, -> { order(total_hours: :desc) }
end
