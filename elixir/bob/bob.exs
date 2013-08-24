defmodule Teenager do
  def hey(statement) do
    cond do
      Heard.silence?(statement) ->
        "Fine. Be that way!"
      Heard.yelling?(statement) ->
        "Woah, chill out!"
      Heard.question?(statement) ->
        "Sure."
      true ->
        "Whatever."
    end
  end
end

defmodule Heard do
  def silence?(statement) do
    String.last(String.lstrip(statement)) == nil
  end

  def yelling?(statement) do
    String.upcase(statement) == statement
  end

  def question?(statement) do
    String.last(statement) == "?"
  end
end
