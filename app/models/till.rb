class Till

  attr_reader :current_order

  TAX_RATE = 8.6

  def initialize
    @current_order = []
  end

  def add_to_order(item)
    current_order << item
  end

  def subtotal
    current_order.inject(0) { |sum, item| sum += item.price }
  end

  def produce_receipt
    receipt = {
      shop_name: "The Coffee Connection",
      address: "123 Lakeside Way",
      phone: "16503600708",
      items_ordered: generate_lines,
      subtotal: subtotal,
      tax: calculate_added_tax_on(subtotal, TAX_RATE),
      total: subtotal + calculate_added_tax_on(subtotal, TAX_RATE)
    }
  end

  def generate_lines
    unique_items = current_order.uniq.map do |item|
      {item: item, quantity: current_order.count(item), line_price: item.price * current_order.count(item)}
    end
  end

  def calculate_added_tax_on(amount, tax_rate)
    ((amount / 100.0) * tax_rate).round
  end

end