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
  
  # fyi: you can take advantage of the fact that ruby
  # will return nil if no return value is specified.
  def average_rating
    if self.reviews.count > 0
      self.reviews.sum('rating') / self.reviews.count
    end
  end
  # or, if you're feeling fancy you can use 'lazy evaluation'.
  # 
  # note: you don't need the self. because average_rating
  # is an instance method, so the self. is implied.
  def average_rating
    reviews.count > 0 && reviews.sum('rating') / reviews.count
  end
end
