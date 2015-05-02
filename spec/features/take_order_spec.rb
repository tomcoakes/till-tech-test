feature "As a barista at the coffee shop, I can take an order." do

  describe "When a customer orders 1 Caffe Latte," do    
    
    let(:till) { Till.new }

    before do
      till.add_to_order(:caffe_latte)
    end
   
    scenario "the current order contains 1 item" do
      expect(till.current_order.count).to eq 1
    end

    scenario "the receipt total is 4.75" do
      receipt = till.generate_receipt
      expect(receipt.total_price).to eq 475
    end

  end

end