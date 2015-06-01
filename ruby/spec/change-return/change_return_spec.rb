describe ChangeReturn do
  it "instantiates properly" do
    cr = ChangeReturn.new
    expect(cr).not_to be_nil
  end

  it "converts dollars to cents" do
    cr = ChangeReturn.new
    expect(cr.convert_to_cents(100)).to eq(10000)
    expect(cr.convert_to_cents(1.05)).to eq(105)
    expect(cr.convert_to_cents(3.14)).to eq(314)
  end

  it "builds the proper change string" do
    cr = ChangeReturn.new
    only_pennies = "Change returned is: 4 pennies."
    expect(cr.build_change_string(4)).to eq(only_pennies)
    one_of_each = "Change returned is: 1 dollar, 1 quarter, 1 dime, 1 nickel, 1 penny."
    expect(cr.build_change_string(141)).to eq(one_of_each)
  end

  describe 'ChangeReturn#pluralize' do
    it "properly pluralizes penny" do
      cr = ChangeReturn.new
      expect(cr.pluralize(2, 'penny')).to eq('pennies')
    end
  end
end