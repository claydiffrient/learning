class Employee
  attr_accessor :name, :id
  @@object_count = 0

  def initialize(name)
    @name = name
    @id = @@object_count
    @@object_count += 1
  end

end