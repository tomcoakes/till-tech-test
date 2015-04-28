describe "Receipt" do
  
  it "begins with no lines" do
    receipt = Receipt.new
    expect(receipt.lines).to be_empty
  end

end