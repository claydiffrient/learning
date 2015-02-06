class FizzBuzz
  def initialize(end_number)
    @end_number = end_number
    @values = []
    @string = ""
  end

  def run
    for i in 1..@end_number
      if (i % 3 == 0) && (i % 5 == 0)
        @values << "FizzBuzz"
      elsif (i % 3 == 0)
        @values << "Fizz"
      elsif (i % 5 == 0)
        @values << "Buzz"
      else
        @values << i
      end
    end
    @string = @values.join ""
  end

  def to_s
    if @has_run
      @string
    else
      run
      @string
    end
  end



end