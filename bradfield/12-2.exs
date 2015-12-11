defmodule Fibonacci do
  def nth(1), do: 1
  def nth(2), do: 1
  def nth(a), do: nth(a - 1) + nth(a - 2)
end

IO.puts "module Fibonacci"
IO.puts Fibonacci.nth(1) # 1
IO.puts Fibonacci.nth(2) # 1
IO.puts Fibonacci.nth(6) # 8

defmodule UtopianTree do
  # base case
  def height(0), do: 1
  def height(a) when rem(a, 2) == 1, do: height(a - 1) * 2
  def height(a), do: height(a - 1) + 1
end

IO.puts "UtopianTree"
IO.puts UtopianTree.height(0) # 1
IO.puts UtopianTree.height(1) # 2
IO.puts UtopianTree.height(2) # 3
IO.puts UtopianTree.height(3) # 6

# f(1) = 1 = 1 # 2^1-1
# f(2) = 1 * 2 = 2 # 2^2-2
# f(3) = (1 * 2) + 1  = 3 # 2^2-1
# f(4) = ((1 * 2) + 1) * 2 = 6 # 2^3-2
# f(5) = 7 # 2^3-1
# f(6) = 14 # 2^4-2
# f(7) = 15 # 2^4-1
# f(8) = 30 # 2^5-2
# f(9) = 31 # 2^5-1
# f(10) = 62 # 2^6-2
# f(11) = 63 # 2^6-1

f = fn (n) ->
  round(:math.pow(2, div(n, 2) + 1)) - 2 + rem(n , 2)
end

IO.puts "non-recursive UtopianTree"
IO.puts f.(1) # 0
IO.puts f.(2) # 1
IO.puts f.(3) # 3
IO.puts f.(11) # 63




# %Model{}
# |> set_name("Foo")
# |> set_title("Bar")

# set_title(set_name(%Model{}, "Foo"), "Bar")
