feature "As a barista at the coffee shop, I can take an order." do

  describe "When a customer orders 1 Caffe Latte," do    
    
    let(:till) { Till.new }
    let(:caffe_latte) { Item.new( {name: "Caffe Latte", price: 475}) }

    before do
      till.add_to_order(caffe_latte)
    end
   
    scenario "the current order contains 1 item" do
      expect(till.current_order.count).to eq 1
    end

    scenario "the item is a Caffe Latte" do
      expect(till.current_order[0].name).to eq "Caffe Latte"
    end

    scenario "the item costs 4.75" do
      expect(till.current_order[0].price).to eq 475
    end

    scenario "the order total is 4.75" do
      expect(till.total_price).to eq 475
    end

    describe "the till produces a receipt" do

      let(:receipt) { till.produce_receipt }

      scenario "with the name of the coffee shop" do
        expect(receipt[:shop_name]).to eq "The Coffee Connection"
      end

      scenario "with the address of the coffee shop" do
        expect(receipt[:address]).to eq "123 Lakeside Way"
      end

      scenario "with the phone number of the coffee shop" do
        expect(receipt[:phone]).to eq "16503600708"
      end

    end

  end

  describe "When a customer orders 2 Caffe Lattes," do

    let(:till) { Till.new }
    let(:caffe_latte) { Item.new( {name: "Caffe Latte", price: 475}) }

    before do
      2.times { till.add_to_order(caffe_latte) }
    end

    scenario "the current order contains 2 items" do
      expect(till.current_order.count).to eq 2
    end

    scenario "the order total is 9.50" do
      expect(till.total_price).to eq 950
    end

  end

end