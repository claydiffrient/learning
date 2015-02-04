describe "Product" do

  describe "#initialize" do
    it "should create a product with default values" do
      product = Product.new
      expect(product.price).to eq(0)
      expect(product.quantity).to eq(1)
    end

    it "should create a product with provided values" do
      product = Product.new 20, 2
      expect(product.price).to eq(20)
      expect(product.quantity).to eq(2)
    end

    it "should increment the id each time" do
      Product.class_variable_set :@@object_count, 0
      a = Product.new
      b = Product.new
      c = Product.new
      expect(c.id).to eq(2)
    end
  end

  describe "#value" do
    it "should return the total value of a product" do
      a = Product.new 20, 3
      expect(a.value).to eq(60)
    end
  end

end