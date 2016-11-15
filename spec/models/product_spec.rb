require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :quantity, presence: true
  # validates :category, presence: true

  # Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category
  # Create an initial example that ensures that a product with all four fields set will indeed save successfully
  # Have one example for each validation, and for each of these:
  # Set all fields to a value but the validation field being tested to nil
  # Test that the expect error is found within the .errors.full_messages array
  # You should therefore have five examples defined given that you have the four validations above

    it 'saves successfully if all four fields are present' do
      @category = Category.new(name: "Animal stuff")
      @product = Product.new(name: "Cat pillow", price: 49, quantity: 1, category: @category)
      expect(@product.save).to be(true)
    end
  
    it 'does not save if name is missing' do
      @category = Category.new(name: "Animal stuff")
      @product = Product.new(price: 49, quantity: 1, category: @category)
      expect(@product.save).to be(false)
    end

    it 'does not save if price is missing' do
      @category = Category.new(name: "Animal stuff")
      @product = Product.new(name: "Cat pillow", quantity: 1, category: @category)
      expect(@product.save).to be(false)
    end

    it 'does not save if quantity is missing' do
      @category = Category.new(name: "Animal stuff")
      @product = Product.new(name: "Cat pillow", price: 49, category: @category)
      expect(@product.save).to be(false)
    end

    it 'does not save if category is missing' do
      # @category = Category.new(name: "Animal stuff")
      @product = Product.new(name: "Cat pillow", price: 49, quantity: 1)
      expect(@product.save).to be(false)
    end

  end
end


