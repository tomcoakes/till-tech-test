require 'spec_helper'

describe Till do

  let(:till) { Till.new }

  it "responds to the method 'add_to_order'" do
    expect(till).to respond_to(:add_to_order).with(1).argument
  end

  it "responds to the method 'total_price'" do
    expect(till).to respond_to(:total_price)
  end

  it "responds to the method 'produce_receipt'" do
    expect(till).to respond_to(:produce_receipt)
  end

  it "is created with an empty order list" do
    expect(till.current_order).to eq []
  end

  describe "total_price" do

    let(:caffe_latte) { double :caffe_latte, price: 475}

    it "sums the prices of all the items in the order" do
      till.add_to_order(caffe_latte)
      expect(till.total_price).to eq 475
    end
  end

  describe "add_to_order" do
    it "adds the item to the current order list" do
      till.add_to_order(:caffe_latte)
      expect(till.current_order).to include(:caffe_latte)
    end
  end

  describe "produce_receipt" do
    it "includes the name of the shop" do
      expect(till.produce_receipt[:shop_name]).not_to be_nil
    end

    it "includes the address of the shop" do
      expect(till.produce_receipt[:address]).not_to be_nil
    end
  end

end