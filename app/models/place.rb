class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pictures
  has_many :reviews

  has_attached_file :image,
                    styles: {medium: '400x200>', thumb: '100x50' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                        content_type: ['image/jpeg', 'image/gif', 'image/png']
                        
  validates :title, presence: true
  validates :description, presence: true
  validates :terms_of_service, acceptance: true
  validates :category, presence: true
  validates :user, presence: 

  def food_rating
    avg_food = Review.where(place: self).average(:grade_food).round(2)
  end

  def service_rating
    avg_service = Review.where(place: self).average(:grade_service).round(2)
  end

  def interior_rating
    avg_interior = Review.where(place: self).average(:grade_interior).round(2)
  end

  def rating
    food = food_rating
    service = service_rating
    interior = interior_rating

    return ((food+service+interior)/3).round(2)
  end
end
