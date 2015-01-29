class Inventory
  def initialize(products = Hash.new)
    @products = products
  end

  def add(product)
    prod = @products[product.id]
    if prod.nil?
      @products[product.id] = product
    else
      prod.quantity += 1
    end
  end

  def remove(product)
    prod = @products[product.id]
    unless prod.nil?
      prod.quantity -= 1
    end
  end

  def products
    @products
  end
end