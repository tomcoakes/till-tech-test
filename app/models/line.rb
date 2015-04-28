class Line

  attr_accessor :price

  def initialize
    @price = 0
    @price_list = {
      caffe_latte: 475
    }
  end

  # REFACTOR
  def printed_price
    price_as_string = @price.to_s
    if price_as_string.length == 1
      return price_as_string.insert(-2, '0.0')
    elsif price_as_string.length == 2
      return price_as_string.insert(-3, '0.')
    else
      price_as_string.insert(-3, '.')
    end
  end

  def add(item)
    item_price = @price_list[item]
    @price += item_price
  end

end