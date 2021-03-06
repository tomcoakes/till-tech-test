feature "As a barista at the coffee shop who has just taken an order, I can receive a customer's payment and return appropriate change." do
 
  describe "When a customer has ordered 1 Caffe Latte and owes 4.75," do

    let(:till) { Till.new("./app/shop_configurations/hipstercoffee.json") }
    let(:caffe_latte) { Item.new( {name: "Caffe Latte", price: 4.75}) }

    before do
      till.add_to_order(caffe_latte)
      till.produce_receipt
    end

    scenario "they can pay 5.16 and receive no change" do
      expect(till.receive_payment(5.16)).to eq 0
    end

    scenario "they can pay 5.41 and receive 0.25 change" do
      expect(till.receive_payment(5.41)).to eq 0.25
    end

    scenario "they receive an error if the amount paid is less than the total price" do
      expect{ till.receive_payment(5.15) }.to raise_error "The total price is more than the customer has paid"
    end

  end

end