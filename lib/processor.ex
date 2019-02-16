defmodule Processor do
  def main(value) do
    value
    |> Float.floor()
    |> trunc
  end

  def secondary(value) do
    value
    |> Float.to_string()
    |> String.split(".")
    |> Enum.at(1)
    |> transform_in_fractional_part
    |> process_second()
  end

  defp transform_in_fractional_part(value) do
    new_value = "0.#{value}"
    {final_value, ""} = Float.parse(new_value)
    final_value
  end

  defp process_second(value) do
    new_value = value * 6000
    final_value = new_value / 100

    final_value
    |> trunc
  end
end
