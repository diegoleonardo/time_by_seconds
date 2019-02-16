defmodule Formatter do
  def show(list) when is_list(list) do
    [hour, minute, second] = Enum.map(list, fn x -> to_two_digits(x) end)
    "#{hour}:#{minute}:#{second}"
  end

  defp to_two_digits(value) do
    digits = value_length(value)

    if digits < 2 do
      "0#{value}"
    else
      value
    end
  end

  defp value_length(value) do
    value
    |> Integer.digits()
    |> Enum.count()
  end
end
