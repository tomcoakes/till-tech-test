require 'spec_helper'

describe Item do

  it "is created with a name" do
    caffe_latte = Item.new("Caffe Latte")
    expect(caffe_latte.name).to eq "Caffe Latte"
  end

  xit "is created with a price" do
    
  end

end