class Checkout
  attr_reader :total

  def initialize(rules = [])
    @total = 0
    @items = []
    @rules = rules
  end

  def scan(item)
    @items << item
    calculate_price
  end

  private

  attr_reader :rules, :items
  attr_writer :total

  def calculate_price
    reset_total

    self.total -= rules.reduce(0) { |sum, rule| sum + rule.calculate_discount(items) }
  end

  def reset_total
    self.total = items.map(&:price).sum
  end
end
