feature "As a barista at the coffee shop, I can take an order." do

  describe "When a customer orders 1 Caffe Latte," do    
    scenario "the receipt total is 4.75" do
      till = Till.new
      till.add(:caffe_latte)
      receipt = till.generate_receipt
      receipt.total_price = 475
    end
  end

end