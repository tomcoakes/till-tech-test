require 'spec_helper'

describe Till do

  let(:till) { Till.new }

  it "responds to the method 'add_to_order'" do
    expect(till).to respond_to(:add_to_order).with(1).argument
  end

  it "responds to the method 'generate_receipt'" do
    expect(till).to respond_to(:generate_receipt)
  end

  it "is created with an empty order list" do
    expect(till.current_order).to eq []
  end

  describe "generate_receipt" do
    it "creates a receipt object" do
      expect(till.generate_receipt).to respond_to(:total_price)
    end
  end

  describe "add_to_order" do
    it "adds the item to the current order list" do
      till.add_to_order(:caffe_latte)
      expect(till.current_order).to include(:caffe_latte)
    end
  end

end