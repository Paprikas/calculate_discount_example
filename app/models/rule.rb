class Rule < ApplicationRecord
  enum kind: {
    multi_buy: 0,
    basket_total: 1
  }, _prefix: true

  def calculate_discount(items: nil, total_price: nil)
    case kind
    when "multi_buy"
      selected_items = items.select { |i| i.name == item_name }
      return 0 if selected_items.empty?
      batches = selected_items.size / batch_size
      return 0 if batches.zero?

      price = selected_items.first.price
      total_price = price * selected_items.size
      exceeded_batch_price = selected_items.size % batch_size * price
      price_with_discount = batches * batch_price + exceeded_batch_price

      total_price - price_with_discount
    when "basket_total"
      return discount if total_price > basket_total_discount
      0
    end
  end
end
