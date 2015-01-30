require_relative './employee'

describe "Employee" do
  describe "#initialize" do
    it "should create an employee with a name" do
      e = Employee.new "Clay"
      expect(e.name).to eq("Clay")
    end

    it "should increase id with each created employee" do
      Employee.class_variable_set :@@object_count, 0
      a = Employee.new "a"
      b = Employee.new "b"
      c = Employee.new "c"
      expect(c.id).to eq(2)
    end
  end
end