require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  def setup
    @item_a = items(:a)
    @item_b = items(:b)
    @rule_a = Rule.new(item_name: "A", batch_size: 3, batch_price: 75)
  end

  test "should scan item and return price without rules (30 for A item)" do
    co = Checkout.new
    co.scan(@item_a)
    assert_equal(30, co.total)
  end

  test "should return 75 for three A items" do
    co = Checkout.new([@rule_a])
    3.times do
      co.scan(@item_a)
    end
    assert_equal(75, co.total)
  end

  test "should return 105 for four A items" do
    co = Checkout.new([@rule_a])
    4.times do
      co.scan(@item_a)
    end
    assert_equal(105, co.total)
  end

  test "should return 125 for four A items and one B item" do
    co = Checkout.new([@rule_a])
    4.times do
      co.scan(@item_a)
    end
    co.scan(@item_b)
    assert_equal(125, co.total)
  end
end
