defmodule Bob do
  def hey(input) do
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.last(input) == "?" -> "Sure."
      Regex.match?(~r/\p{Lu}\p{Lu}/u, input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end


