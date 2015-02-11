class Collatz
  def initialize(num)
    if (num <= 1)
      raise_error "num must be greater than 1"
    end
    @num = num
  end

  def run(num = @num, steps = 0)
    if (num == 1)
      return steps
    elsif (num % 2 == 0)
      run(num / 2, steps + 1)
    else
      run((num * 3) + 1, steps + 1)
    end
  end
end

if __FILE__ == $0
  x = Collatz.new(ARGV.first.to_i)
  puts x.run
end