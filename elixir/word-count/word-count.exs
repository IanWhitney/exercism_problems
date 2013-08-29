defmodule Words do
  def count(phrase) do
    word_list = Phrase.to_word_list(phrase)

    HashDict.new(word_list, fn(word) ->
      {word, _times_in_list(word_list, word)} 
    end)
  end

  defp _times_in_list(list, word) do
    Enum.count(list, fn(x) -> (x == word) end) 
  end
end

defmodule Phrase do
  def to_word_list(phrase) do
    Regex.split(%r/\W+/, phrase)
      |> List.downcase
      |> List.compact
  end
end

defmodule List do
  def downcase(list), do: Enum.map(list, &(String.downcase(&1)))
  def compact(list), do: Enum.reject(list, &(&1 == ""))
end
