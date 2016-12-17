class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user, presence: true
  validates :place, presence: true
  validates :grade_food, presence: true
  validates :grade_service, presence: true
  validates :grade_interior, presence: true
end
