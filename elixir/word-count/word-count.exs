
defmodule Words do
  def count(phrase) do
    word_list = Phrase.to_word_list(phrase)

    HashDict.new(
      word_list, fn(word) -> 
        {word, Enum.count(
          word_list, fn(x) -> 
            (x == word) 
          end)
        } 
      end
    )
  end
end

defmodule Phrase do
  def to_word_list(phrase) do
    Phrase.to_list(phrase)
      |> List.downcase
      |> List.compact
  end

  def to_list(phrase) do
    Regex.split %r/\W+/, phrase
  end
end

defmodule List  do
  def downcase(list) do
    Enum.map(list, fn(x) ->
      String.downcase(x) 
    end)
  end

  def compact(list) do
    Enum.reject(list, fn(x) ->
      x == "" 
    end)
  end
end
