feature "As a barista at the coffee shop, I can take an order." do

  describe "When a customer orders 1 Caffe Latte," do
    
    scenario "the line total is 4.75" do
      line = Line.new
      line.add(:caffe_latte)
      expect(line.printed_price).to eq "4.75"
    end

  end

  describe "When a customer orders 2 Caffe Lattes," do

    scenario "the line total is 9.50" do
      line = Line.new
      line.add(:caffe_latte)
      line.add(:caffe_latte)
      expect(line.printed_price).to eq "9.50"
    end

  end

end