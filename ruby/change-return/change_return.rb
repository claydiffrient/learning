class ChangeReturn
  def prompt(*args)
    print(*args)
    gets
  end

  def run
    total_amount = prompt('Total Cost: ').to_f
    money_given = prompt('Total Given: ').to_f

    (money_given - total_amount)
  end
end

if __FILE__ == $PROGRAM_NAME
  x = ChangeReturn.new
  puts format '%.2f', x.run
end
