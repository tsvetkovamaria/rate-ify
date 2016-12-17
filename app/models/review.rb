class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validate :user, presence: true
  validate :place, presence: true
  validate :grade_food, presence: true
  validate :grade_service, presence: true
  validate :grade_interior, presence: true
end
