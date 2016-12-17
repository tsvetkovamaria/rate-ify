class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pictures

  has_attached_file :image,
                    styles: {medium: '400x200>', thumb: '100x50' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                        content_type: ['image/jpeg', 'image/gif', 'image/png']
                        
  validates :title, presence: true
  validates :description, presence: true
  validates :agreement, presence: true
  validates :category, presence: true
  validates :user, presence: true
end
