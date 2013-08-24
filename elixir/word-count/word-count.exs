
defmodule Words do
  
  def count(phrase) do
    split_phrase_into_words = fn(p) -> Regex.split %r/\W+/, p end
    downcase_elements = fn(l) -> Enum.map(l, fn(x) ->
      String.downcase(x) end ) end
    remove_empty_elements = fn(l) -> Enum.reject(l, fn(x) ->
      x == "" end) end  
    
    cleaned_words =
    remove_empty_elements.(downcase_elements.(split_phrase_into_words.(phrase)))

    HashDict.new(
      cleaned_words, fn(word) -> 
        {word, Enum.count(
          cleaned_words, fn(x) -> 
            (x == word) 
          end)
        } 
      end
    )
  end
end

