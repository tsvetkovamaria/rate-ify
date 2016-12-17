class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_attached_file :image,
                    styles: {medium: '300x300>', thumb: '100x100' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                        content_type: ['image/jpeg', 'image/gif', 'image/png']

  validates :image, presence: true
  validates :user, presence: true
  validates :place, presence: true
end
