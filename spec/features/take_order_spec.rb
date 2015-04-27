feature "As a barista at the coffee shop, I can take an order" do

  describe "When a customer orders 1 Caffe Latte" do
    
    before do
      order = Order.new
      line = Line.new
    end

    scenario "The line total is 4.75" do
      order.add(:caffe_latte)
      expect(line.price_total).to eq "4.75"
    end

  end

end