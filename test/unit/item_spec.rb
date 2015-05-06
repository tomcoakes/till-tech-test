require 'spec_helper'

describe Item do

  let(:example_item) { {name: "Caffe Latte", price: 475} }

  it "is created with a name" do
    caffe_latte = Item.new(example_item)
    expect(caffe_latte.name).to eq "Caffe Latte"
  end

  it "is created with a price" do
    caffe_latte = Item.new(example_item)
    expect(caffe_latte.price).to eq 475
  end

end