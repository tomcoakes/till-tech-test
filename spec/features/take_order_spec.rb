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
      expect(till.subtotal).to eq 475
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

      scenario "with a list of the items ordered" do
        expect(receipt[:items_ordered]).to eq([{item: caffe_latte, quantity: 1, line_price: 475}])
      end

      scenario "with the total price before tax" do
        expect(receipt[:subtotal]).to eq 475
      end

      scenario "with the amount of tax to be added" do
        expect(receipt[:tax]).to eq 41
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
      expect(till.subtotal).to eq 950
    end

    describe "the till produces a receipt" do

      let(:receipt) { till.produce_receipt }

      scenario "with a list of the items ordered" do
        expect(receipt[:items_ordered]).to eq([{item: caffe_latte, quantity: 2, line_price: 950}])
      end

    end

  end

  describe "When a customer orders 2 Caffe Lattes and 1 Blueberry Muffin" do

    let(:till) { Till.new }
    let(:caffe_latte) { Item.new( {name: "Caffe Latte", price: 475}) }
    let(:blueberry_muffin) { Item.new( {name: "Blueberry Muffin", price: 405}) }

    before do
      2.times { till.add_to_order(caffe_latte) }
      till.add_to_order(blueberry_muffin)
    end

    scenario "the current order contains 2 items" do
      expect(till.current_order.count).to eq 3
    end

    scenario "the order total is 9.50" do
      expect(till.subtotal).to eq 1355
    end

    describe "the till produces a receipt" do

      let(:receipt) { till.produce_receipt }

      scenario "with a list of the items ordered" do
        expect(receipt[:items_ordered]).to eq([{item: caffe_latte, quantity: 2, line_price: 950}, {item: blueberry_muffin, quantity: 1, line_price: 405}])
      end

      scenario "with the total price before tax" do
        expect(receipt[:subtotal]).to eq 1355
      end

    end

  end

end