class Till

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_to_order(item)
    current_order << item
  end

  def total_price
    current_order.inject(0) { |sum, item| sum += item.price }
  end

  def produce_receipt
    {
      shop_name: "The Coffee Connection",
      address: "123 Lakeside Way",
      phone: "16503600708",
      items_ordered: generate_lines
    }
  end

  def generate_lines
    lines = []
    current_order.each do |item|
      lines << {item: item, quantity: 1, line_price: item.price}
    end
    return lines
  end

end