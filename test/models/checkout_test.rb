require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  test "should scan item and return price without rules" do
    item = items(:one)
    co = Checkout.new
    co.scan(item)
    assert_equal(10, co.total)
  end
end
