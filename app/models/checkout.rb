class Checkout
  attr_reader :total

  def initialize(rules = [])
    @total = 0
    @items = []
    @rules = rules
  end

  def scan(item)
    @items << item
    reset_total
    calculate_price if rules.present?
  end

  private

  attr_reader :rules, :items
  attr_writer :total

  def calculate_price
    multi_buy_rules = rules.select(&:kind_multi_buy?)
    basket_total_rules = rules.select(&:kind_basket_total?)

    self.total -= multi_buy_rules.reduce(0) { |sum, rule| sum + rule.calculate_discount(items: items) }
    self.total -= basket_total_rules.reduce(0) { |sum, rule| sum + rule.calculate_discount(total_price: total) }
  end

  def reset_total
    self.total = items.map(&:price).sum
  end
end
