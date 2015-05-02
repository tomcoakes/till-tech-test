require 'spec_helper'

describe Item do

  it "is created with a name" do
    caffe_latte = Item.new("Caffe Latte", 475)
    expect(caffe_latte.name).to eq "Caffe Latte"
  end

  it "is created with a price" do
    caffe_latte = Item.new("Caffe Latte", 475)
    expect(caffe_latte.price).to eq 475
  end

end