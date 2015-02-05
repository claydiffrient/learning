class FizzBuzz
  def initialize(end_number)
    @end_number = end_number
  end

  def run
    for i in 1..@end_number
      if (i % 3 == 0) && (i % 5 == 0)
        puts "FizzBuzz"
      elsif (i % 3 == 0)
        puts "Fizz"
      elsif (i % 5 == 0)
        puts "Buzz"
      else
        puts i
      end
    end
  end
end

f = FizzBuzz.new 20
f.run()