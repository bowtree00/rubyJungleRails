class Review < ActiveRecord::Base

  validates :rating, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  # Might be good to validate that the review has a user_id and product_id.

  belongs_to :product
  belongs_to :user
end

# Add validations to the model. Think about what is going to be required to be present for the Review to be considered valid, answering the following questions for yourself:

# Is a review without a product (parent) valid?
# Is a review without a user (reviewer) valid?
# Is a review with no description valid?
# Is a review with no rating valid?