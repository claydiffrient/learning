describe FizzBuzz do
  it "instantiates properly" do
    fizzbuzz = FizzBuzz.new 10
    expect(fizzbuzz).not_to be_nil
  end

  it "creates a string containing the results" do
    fizzbuzz = FizzBuzz.new 10
    expect(fizzbuzz.to_s).to eq("12Fizz4BuzzFizz78FizzBuzz")
  end
end