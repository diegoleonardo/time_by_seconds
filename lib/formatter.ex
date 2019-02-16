defmodule Formatter do
  def show(list) when is_list(list) do
    [hour, minute, second] = Enum.map(list, fn x -> to_two_digits(x) end)
    "#{hour}:#{minute}:#{second}"
  end

  defp to_two_digits(value) do
    digits = value_length(value)

    cond do
      digits < 2 -> "0#{value}"
      true -> value
    end
  end

  defp value_length(value) do
    Integer.digits(value) |> Enum.count()
  end
end
