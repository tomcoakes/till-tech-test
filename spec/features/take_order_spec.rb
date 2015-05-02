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

  describe "When a customer orders 2 Caffe Lattes," do

    let(:till) { Till.new }

    before do
      2.times { till.add_to_order(:caffe_latte) }
    end

    scenario "the current order contains 2 items" do
      expect(till.current_order.count).to eq 2
    end

    scenario "the receipt total is 9.50" do
      receipt = till.generate_receipt
      expect(receipt.total_price).to eq 950
    end

  end

end