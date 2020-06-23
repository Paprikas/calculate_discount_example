require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  def setup
    @item_a = items(:a)
    @item_b = items(:b)
    @rule_a = Rule.new(kind: :multi_buy, item_name: "A", batch_size: 3, batch_price: 75)
    @rule_b = Rule.new(kind: :multi_buy, item_name: "B", batch_size: 2, batch_price: 35)
    @rule_c = Rule.new(kind: :basket_total, basket_total_discount: 150, discount: 20)
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

  test "should return 105 for four A items (discount applied for each three)" do
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

  test "should return 35 for two B items" do
    co = Checkout.new([@rule_b])
    2.times do
      co.scan(@item_b)
    end
    assert_equal(35, co.total)
  end

  test "should return 55 for three B items (discount applied for each two)" do
    co = Checkout.new([@rule_b])
    3.times do
      co.scan(@item_b)
    end
    assert_equal(55, co.total)
  end

  test "should return for seven A items (multi buy discount + 20 discount applied)" do
    co = Checkout.new([@rule_a, @rule_c])
    7.times do
      co.scan(@item_a)
    end
    assert_equal(160, co.total)
  end
end
