class ChangeReturn
  def prompt(*args)
    print(*args)
    gets
  end

  def pluralize(amount, text)
    if amount > 1
      return "#{text}s" unless text == 'penny'
      'pennies'
    else
      text
    end
  end

  def run
    total_amount = prompt('Total Cost: ').to_f
    money_given = prompt('Total Given: ').to_f

    to_return = convert_to_cents(money_given - total_amount)
    print build_change_string(to_return)
  end

  def convert_to_cents(dollars)
    dollars * 100
  end

  def build_change_string(amount)
    ret_val = 'Change returned is: '
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
      word = pluralize(value[:dollars], 'dollar')
      ret_val += "#{value[:dollars]} #{word}, "
    end
    if value[:quarters] > 0
      word = pluralize(value[:quarters], 'quarter')
      ret_val += "#{value[:quarters]} #{word}, "
    end
    if value[:dimes] > 0
      word = pluralize(value[:dimes], 'dime')
      ret_val += "#{value[:dimes]} #{word}, "
    end
    if value[:nickels] > 0
      word = pluralize(value[:nickels], 'nickel')
      ret_val += "#{value[:nickels]} #{word}, "
    end
    if value[:pennies] > 0
      word = pluralize(value[:pennies], 'penny')
      ret_val += "#{value[:pennies]} #{word}."
    end

    ret_val
  end

end

if __FILE__ == $PROGRAM_NAME
  x = ChangeReturn.new
  x.run
end
