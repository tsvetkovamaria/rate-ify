class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user, presence: true
  validates :place, presence: true
  validates :grade_food, presence: true, numericality: { less_than_or_equal_to: 5 }
  validates :grade_service, presence: true, numericality: { less_than_or_equal_to: 5 }
  validates :grade_interior, presence: true, numericality: { less_than_or_equal_to: 5 }
end
