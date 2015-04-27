feature "As a barista at the coffee shop, I can take an order" do

  describe "When a customer orders 1 Caffe Latte" do
    
    scenario "The line total is 4.75" do
      order = Order.new
      line = Line.new
      order.add(:caffe_latte)
      expect(line.price_total).to eq "4.75"
    end

  end

end