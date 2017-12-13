require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: 'product1', description: 'description1', quantity: 3, category: 'yes')
      @product2 = Product.create!(name: 'product2', description: 'description2', quantity: 5, category: 'yes')
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'test@test.com',
        total_cents: 123,
        stripe_charge_id: 'string'
      )
      # 2. build line items on @order
      order.line_items.new = LineItem.new(
        order_id: @order,
        product_id: @product1,
        quantity: 1,
        item_price: 20,
        total_price: 1 * 20
      )
      order.line_item2 = LineItem.new(
        order_id: @order,
        product_id: @product2,
        quantity: 3,
        item_price: 20,
        total_price: 3 * 20
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be 2
      expect(@product2.quantity).to be 2
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
