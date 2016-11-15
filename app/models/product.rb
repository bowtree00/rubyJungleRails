class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, -> { order "created_at DESC" } 

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true


  def sold_out?
    quantity == 0
  end

  def average_rating
    if self.reviews.count > 0
      self.reviews.sum('rating') / self.reviews.count
    else
      nil
    end
  end
  
end
