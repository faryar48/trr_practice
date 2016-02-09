class Squares
  VERSION = 2

  def initialize(num)
    @num = num
  end

  def sum_of_squares
    sum = 0
    num = @num
    until num == 0
      sum += num ** 2
      num -= 1
    end
    sum
  end

  def square_of_sum
    sum = 0
    num = @num
    until num == 0
      sum += num
      num -= 1
    end
    sum ** 2
  end

  def difference
    if square_of_sum > sum_of_squares
      square_of_sum - sum_of_squares
    else
      sum_of_squares - square_of_sum
    end
  end
end
