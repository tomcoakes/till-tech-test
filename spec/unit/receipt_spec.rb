require 'spec_helper'

describe Receipt do

  it "responds to total_price" do
    expect(Receipt.new).to respond_to(:total_price)
  end

end