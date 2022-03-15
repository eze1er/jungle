require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @category = Category.create()
      @product = Product.create(
        name: "product name",
        price_cents: 2000,
        quantity: 3,
        category: @category
      )
      expect(@product).to be_valid
    end

    it 'should not create a product if name is nil' do
      @product = Product.new(name: nil)
      @product.valid?
      expect(@product.errors[:name]).to include("can\'t be blank")
    end 
    it 'should not create a product if price is 0' do
      @product = Product.new(price_cents: nil)
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
    end 
    it 'should not create a product if price is 0' do
      @product = Product.new(quantity: nil)
      @product.valid?
      expect(@product.errors[:quantity]).to include("can\'t be blank")
    end 
    it 'should not create a product if name is nil' do
      @product = Product.new(category: nil)
      @product.valid?
      expect(@product.errors[:category]).to include("can\'t be blank")
    end 
  end
end
