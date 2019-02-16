defmodule Processor do
  def main(value_in_secondes, value_to_divide) do
    value_to_process = value_in_secondes / value_to_divide

    value_to_process
    |> Float.floor()
    |> trunc
  end

  def secondary(value_in_secondes, value_to_divide) do
    value_to_process = value_in_secondes / value_to_divide

    value_to_process
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
