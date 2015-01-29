class Product
  attr_accessor :price, :id, :quantity
  @@object_count = 0

  def initialize(price = 0, quantity = 1)
    @id = @@object_count
    @price = price
    @quantity = quantity
    @@object_count += 1
  end
end