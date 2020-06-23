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
    return self.total = items.map(&:price).sum if rules.empty?
    reset_total

    rules.each do |rule|
      self.total += rule.calculate_price(items)
    end
  end

  def reset_total
    self.total = 0
  end
end
