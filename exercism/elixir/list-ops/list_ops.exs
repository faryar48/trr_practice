defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list, counter \\ 0)
  def count([], counter), do: counter
  def count(list, counter) do
    [_|tail] = list
    count(tail, counter + 1)
  end

  @spec reverse(list) :: list

  def reverse(l, reversed_list \\ [])
  def reverse([], reversed_list), do: reversed_list
  def reverse(l, reversed_list) do
    [h|t] = l
    head = [h]
    reversed_list = [reverse(t)|head]
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do

  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
