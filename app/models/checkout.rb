class Checkout
  def initialize
    @total = 0
  end

  def scan(item)
    @total += item.price
  end

  def total
    @total
  end
end
