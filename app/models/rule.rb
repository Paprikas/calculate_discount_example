class Rule < ApplicationRecord
  def calculate_price(items)
    selected_items = items.select { |i| i.name == item_name }
    return 0 if selected_items.empty?

    item_price = selected_items.first.price
    batches = selected_items.size / batch_size

    if batches.zero?
      selected_items.map(&:price).sum
    else
      rest_items = selected_items.size % batch_size
      batches * batch_price + rest_items * item_price
    end
  end
end
