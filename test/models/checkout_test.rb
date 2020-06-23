require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  test "should scan item and return price without rules" do
    item = items(:a)
    co = Checkout.new
    co.scan(item)
    assert_equal(30, co.total)
  end

  test "should return 75 for three A items" do
    item = items(:a)
    rule = Rule.new(item_name: "A", batch_size: 3, batch_price: 75)
    co = Checkout.new([rule])
    3.times do
      co.scan(item)
    end
    assert_equal(75, co.total)
  end

  test "should return 95 for four A items" do
    item = items(:a)
    rule = Rule.new(item_name: "A", batch_size: 3, batch_price: 75)
    co = Checkout.new([rule])
    4.times do
      co.scan(item)
    end
    assert_equal(105, co.total)
  end
end
