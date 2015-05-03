require 'spec_helper'

describe Till do

  let(:till) { Till.new("./app/shop_configurations/hipstercoffee.json") }

  it "is initialized with a till_configuration" do
    expect(till.configuration).not_to be_nil
  end

  it "responds to the method 'add_to_order'" do
    expect(till).to respond_to(:add_to_order).with(1).argument
  end

  it "responds to the method 'subtotal'" do
    expect(till).to respond_to(:subtotal)
  end

  it "responds to the method 'produce_receipt'" do
    expect(till).to respond_to(:produce_receipt)
  end

  it "responds to the method 'generate_lines'" do
    expect(till).to respond_to(:generate_lines)
  end

  it "responds to the method 'load_from'" do
    expect(till).to respond_to(:load_from).with(1).argument
  end

  it "responds to the method 'receive_payment'" do
    expect(till).to respond_to(:receive_payment).with(1).argument
  end

  it "has a tax rate" do
    expect(Till::TAX_RATE).not_to be_nil
  end

  it "has a discount rate for big spenders" do
    expect(Till::BIG_SPENDER_DISCOUNT_RATE).not_to be_nil
  end

  it "is created with an empty order list" do
    expect(till.current_order).to eq []
  end

  context "till methods" do

    describe "#subtotal" do
      let(:caffe_latte) { double :caffe_latte, price: 4.75}

      it "sums the prices of all the items in the order" do
        till.add_to_order(caffe_latte)
        expect(till.subtotal).to eq 4.75
      end
    end

    describe "#add_to_order" do
      it "adds the item to the current order list" do
        till.add_to_order(:caffe_latte)
        expect(till.current_order).to include(:caffe_latte)
      end
    end

    describe "#generate_lines" do
      let(:caffe_latte) { double :caffe_latte, price: 4.75}
      
      it "returns the item object" do
        till.add_to_order(caffe_latte)
        expect(till.generate_lines.first[:item]).to eq caffe_latte
      end

      it "returns the item's quantity" do
        till.add_to_order(caffe_latte)
        expect(till.generate_lines.first[:quantity]).to eq 1
      end

      it "returns the line's price" do
        till.add_to_order(caffe_latte)
        expect(till.generate_lines.first[:line_price]).to eq 4.75
      end

      it "returns the quantity 2 when an item is ordered twice" do
        till.add_to_order(caffe_latte)
        till.add_to_order(caffe_latte)
        expect(till.generate_lines.first[:quantity]).to eq 2
      end
    end

    describe "#produce_receipt" do

      let(:caffe_latte) { double :caffe_latte, price: 4.75}

      before do
        till.load_from("./app/shop_configurations/hipstercoffee.json")
      end

      it "returns the name of the shop" do
        expect(till.produce_receipt[:shop_name]).to eq "The Coffee Connection"
      end

      it "returns the address of the shop" do
        expect(till.produce_receipt[:address]).to eq "123 Lakeside Way"
      end

      it "returns the phone number of the shop" do
        expect(till.produce_receipt[:phone]).to eq "16503600708"
      end

      it "returns a list of the items ordered" do
        till.add_to_order(caffe_latte)
        expect(till.produce_receipt[:items_ordered].first[:item]).to eq(caffe_latte)
      end

      it "returns the amount of discount added to the subtotal" do
        till.add_to_order(caffe_latte)
        expect(till.produce_receipt[:discount]).to eq 0
      end

      it "returns the total price before tax" do
        till.add_to_order(caffe_latte)
        expect(till.produce_receipt[:subtotal]).to eq 4.75
      end

      it "returns the amount of tax to be added" do
        till.add_to_order(caffe_latte)
        expect(till.produce_receipt[:tax]).to eq 0.41
      end

      it "returns the total price after tax" do
        till.add_to_order(caffe_latte)
        expect(till.produce_receipt[:total]).to eq 5.16
      end
    end

    describe "#receive_payment" do

      let(:caffe_latte) { double :caffe_latte, price: 4.75}

      before do
        till.add_to_order(caffe_latte)
        till.produce_receipt        
      end

      it "returns 0 change when amount paid is equal to the price" do
        expect(till.receive_payment(5.16)).to eq 0
      end

      it "returns 0.25 change when amount paid is 0.25 more than the price" do
        expect(till.receive_payment(5.41)).to eq 0.25
      end

      it "throws an error when the payment is less than the price" do
        expect{ till.receive_payment(5.15) }.to raise_error "The total price is more than the customer has paid"
      end

    end

    describe "#calculate_added_tax_on helper method" do
      it "returns 10 for 100 when the tax rate is set at 10%" do
        TAX_RATE = 10
        expect(till.calculate_added_tax_on(100, TAX_RATE)).to eq 10
      end
    end

    describe "#calculate_discount helper method" do

      it "returns 5 for 100 when the price discount rate is set at 5%" do
        BIG_SPENDER_DISCOUNT_RATE = 5
        expect(till.calculate_discount(100, BIG_SPENDER_DISCOUNT_RATE)).to eq 5
      end

      it "returns 0 for 40 when the price discount rate is set at 5%" do
        expect(till.calculate_discount(40, BIG_SPENDER_DISCOUNT_RATE)).to eq 0
      end
    end
  end
end