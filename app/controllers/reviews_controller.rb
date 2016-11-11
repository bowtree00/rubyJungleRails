class ReviewsController < ApplicationController

def create
  # find the parent model
  # Use the has_many association to initialize the child instance
  # Attempt to save
  # If successful: redirect to appropriate page
  # Else: render the page where the form resides

  @product = Product.find(params[:product_id])
  @review = Review.new(review_params)
  @review.product_id = @product.id

  # after @review has been initialized, but before calling .save on it. This adds the current user's ID to 'user_id' in review
  @review.user = current_user
  
  if @review.save
    # redirect_to "/products/#{params[:product_id]}"
    redirect_to product_path(@product)
  else
    render :'products/show'
  end

end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
