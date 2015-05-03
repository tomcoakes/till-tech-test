require_relative 'menu'

class Till

  include Menu

  attr_reader :current_order, :configuration

  TAX_RATE = 8.6

  def initialize(till_configuration_file)
    @current_order = []
    @configuration = self.load_from(till_configuration_file)
  end

  def add_to_order(item)
    current_order << item
  end

  def subtotal
    current_order.inject(0) { |sum, item| sum += item.price }
  end

  def produce_receipt
    {
      shop_name: configuration[0]["shopName"],
      address: configuration[0]["address"],
      phone: configuration[0]["phone"],
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
    ((amount / 100.0) * tax_rate).round(2)
  end

end