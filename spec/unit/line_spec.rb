describe "Line" do
  
  it "begins with a price total of 0" do
    line = Line.new
    expect(line.price).to eq 0
  end

  it "begins with a printed price total of 0.00" do
    line = Line.new
    expect(line.printed_price).to eq "0.00"
  end

  it "has a printed price total of 4.75 when the price is 475" do
    line = Line.new
    line.price += 475
    expect(line.printed_price).to eq "4.75"
  end

end