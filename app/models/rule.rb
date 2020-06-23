class Rule < ApplicationRecord
  def calculate_discount(items)
    selected_items = items.select { |i| i.name == item_name }
    return 0 if selected_items.empty?

    batches = selected_items.size / batch_size
    return 0 if batches.zero?

    total_price = selected_items.first.price * batch_size
    price_with_discount = batches * batch_price
    total_price - price_with_discount
  end
end
