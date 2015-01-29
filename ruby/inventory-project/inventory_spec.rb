require_relative './inventory'
require_relative './product'

describe Inventory do

  before :all do
    @inventory = Inventory.new
    @product = Product.new
  end

  describe "#add" do
    it "should add a product to inventory if it isn't already there." do
      @inventory.add(@product)
      expect(@inventory.products.count).to eq(1)
      expect(@inventory.products[0].quantity).to eq(1)
    end

    it "should increase the quantity if the item is already in the inventory" do
      @inventory.add(@product)
      expect(@inventory.products.count).to eq(1)
      expect(@inventory.products[0].quantity).to eq(2)
    end
  end

  describe "#remove" do
    it "should reduce the quantity by one of an item." do
      @inventory.remove(@product)
      expect(@inventory.products.count).to eq(1)
      expect(@inventory.products[0].quantity).to eq(1)
    end

    it "should remove an item if the initial quantity is 0" do
      @inventory.remove(@product)
      @inventory.remove(@product)
      expect(@inventory.products.count).to eq(0)
    end
  end
end

