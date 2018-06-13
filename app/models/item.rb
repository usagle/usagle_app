class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :description, :image_url, presence: true
  #validates :title, uniqueness: true
  #validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 1000  }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\Z/i,
    message: 'The URL should point to a GIF, JPG or PNG image.'
  }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
