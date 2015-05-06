require 'spec_helper'

class ExampleTill; include Menu; end

describe Menu do

  it "can read a menu from a file" do
    file_location = "./app/shop_configurations/hipstercoffee.json"
    till = ExampleTill.new
    till_configuration = till.load_from(file_location)
    expect(till_configuration[0]["shopName"]).to eq "The Coffee Connection"
  end
  
end