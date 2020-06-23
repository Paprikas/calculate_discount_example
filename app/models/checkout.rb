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

  attr_reader :rules

  def calculate_price
    return @total = @items.map(&:price).sum if rules.empty?

    rules.each do |rule|
      selected_items = @items.select { |i| i.name == rule.item_name }
      next if selected_items.empty?

      item_price = selected_items.first.price

      batches = selected_items.size / rule.batch_size
      if batches.zero?
        @total = selected_items.map(&:price).sum
      else
        rest_items = selected_items.size % rule.batch_size
        @total = batches * rule.batch_price + rest_items * item_price
      end
    end
  end
end
