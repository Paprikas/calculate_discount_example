class Checkout
  attr_reader :total

  def initialize
    @total = 0
    @items = []
  end

  def scan(item)
    @items << item
    calculate_price
  end

  private

  def calculate_price
    batches = @items.size / 3
    if batches.zero?
      @total = @items.map(&:price).sum
    else
      rest_items = @items.size % 3
      @total = batches * 75 + rest_items * 30
    end
  end
end
