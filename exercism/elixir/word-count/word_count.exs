require IEx

defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = List.flatten(Regex.scan(~r/[[:alnum:]-]+/u, sentence))
    Enum.reduce(words, %{}, fn(word, word_count) ->
      word = String.downcase(word)
      if Map.has_key?(word_count, word) do
        count = Map.get(word_count, word) + 1
        Map.put(word_count, word, count)
      else
        Map.put(word_count, word, 1)
      end
    end)
  end
end

