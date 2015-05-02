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

end