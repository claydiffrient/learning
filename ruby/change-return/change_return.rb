class ChangeReturn
  def prompt(*args)
    print(*args)
    gets
  end

  def run
    total_amount = prompt('Total Cost: ').to_f
    money_given = prompt('Total Given: ').to_f

    to_return = (money_given - total_amount)
    print build_change_string(to_return)
  end

  def convert_to_cents(dollars)
    dollars * 100
  end

  def build_change_string(amount)
    ret_val = 'Change returned is:'
    value = {
      dollars: 0,
      quarters: 0,
      dimes: 0,
      nickels: 0,
      pennies: 0
    }
    while amount > 0 do
      if amount >= 100
        value[:dollars] = amount / 100
        amount = amount - value[:dollars] * 100
      elsif amount >= 25
        value[:quarters] = amount / 25
        amount = amount - value[:quarters] * 25
      elsif amount >= 10
        value[:dimes] = amount / 10
        amount = amount - value[:dimes] * 10
      elsif amount >= 5
        value[:nickels] = amount / 5
        amount = amount - value[:nickels] * 5
      elsif amount >= 1
        value[:pennies] = amount
        amount = amount - value[:pennies]
      end
    end

    if value[:dollars] > 0
      ret_val += "#{value[:dollars]} dollars,"
    end
    if value[:quarters] > 0
      ret_val += "#{value[:quarters]} quarters,"
    end
    if value[:dimes] > 0
      ret_val += "#{value[:dimes]} dimes,"
    end
    if value[:nickels] > 0
      ret_val += "#{value[:nickels]} nickels,"
    end
    if value[:pennies] > 0
      ret_val += "#{value[:pennies]} pennies."
    end

    ret_val
  end

end

if __FILE__ == $PROGRAM_NAME
  x = ChangeReturn.new
  x.run
end
