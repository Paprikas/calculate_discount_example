require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  test "should scan item and return price without rules" do
    item = items(:one)
    co = Checkout.new
    co.scan(item)
    assert_equal(10, co.total)
  end

  test "should return 75 for three A items" do
    item = items(:a)
    co = Checkout.new
    3.times do
      co.scan(item)
    end
    assert_equal(75, co.total)
  end
end
