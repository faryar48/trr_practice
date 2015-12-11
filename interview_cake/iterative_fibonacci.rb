def fib_iterative(n)
  if n < 0
    raise Exception, "There are no negative indices in a series."
  elsif n == 0 || n == 1
    return n
  end


  prev = 0
  prev_prev = 1
  current = 0

  n.times do
    current = prev_prev + prev
    prev_prev = prev
    prev = current
  end

  return current

end

p fib_iterative(0)
p fib_iterative(1)
p fib_iterative(2)
p fib_iterative(3)


class Fibber
  def initialize
    @memo = {}
  end

  def fib(n)
    if n < 0
      raise Exception, "There are no negative indices in a series."
    elsif (n == 0 || n == 1)
      return n
    end

    return @memo[n] if @memo.include?(n)

    result = self.fib(n - 2) + self.fib(n - 1)

    @memo[n] = result

    return result
  end
end

f = Fibber.new
p f.fib(0)
p f.fib(1)
p f.fib(2)
p f.fib(3)


