require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'when all fields are filled' do
      it 'should be valid' do
        @category = Category.new(name: 'category')
        @product = Product.new(name: 'product', price: 10, quantity: 3, category: @category)
        expect(@product.valid?).to be_truthy
      end
    end

    context 'when name is nil' do
      it 'should be invalid' do
        @category = Category.new(name: 'category')
        @product = Product.new(price: 10, quantity: 3, category: @category)
        expect(@product.valid?).not_to be_truthy
      end
    end

    context 'when price is nil' do
      it 'should be invalid' do
        @category = Category.new(name: 'category')
        @product = Product.new(name: 'product', quantity: 3, category: @category)
        expect(@product.valid?).not_to be_truthy
      end
    end

    context 'when quantity is nil' do
      it 'should be invalid' do
        @category = Category.new(name: 'category')
        @product = Product.new(name: 'product', price: 10, category: @category)
        expect(@product.valid?).not_to be_truthy
      end
    end

    context 'when category is nil' do
      it 'should be invalid' do
        @category = Category.new(name: 'category')
        @product = Product.new(name: 'product', price: 10, quantity: 3)
        expect(@product.valid?).not_to be_truthy
      end
    end
  end
end
