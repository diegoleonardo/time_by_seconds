defmodule TimeBySeconds do
  @one_minute_in_seconds 60
  @one_hour_in_seconds 3600

  @moduledoc """
  Documentation for TimeBySeconds.

  This module it's used to calculate time based in seconds passed through parameter

  """

  @doc """
  Calculates time when second param is less then or equal, 0 seconds

  ## Examples

      iex> TimeBySeconds.calculate(80)
      "00:00:20"

  """
  def calculate(seconds) when seconds <= 0, do: Formatter.show([0, 0, 0])

  @doc ~S"""
  Calculates time when second param is less then 60 seconds

  ## Examples

      iex> TimeBySeconds.calculate(20)
      "00:00:20"

  """
  def calculate(seconds) when seconds < @one_minute_in_seconds,
    do: Formatter.show([0, 0, seconds])

  @doc ~S"""
  Calculates time when second param is greater than or equal, 60 seconds(one minute)
  and less than 3600 seconds(one hour)

  ## Examples

      iex> TimeBySeconds.calculate(80)
      "00:01:20"

  """
  def calculate(seconds)
      when seconds >= @one_minute_in_seconds and seconds < @one_hour_in_seconds do
    minute =
      (seconds / @one_minute_in_seconds)
      |> Processor.main()

    seconds =
      (seconds / @one_minute_in_seconds)
      |> Processor.secondary()

    Formatter.show([0, minute, seconds])
  end

  @doc ~S"""
  Calculates time when second param is greater than 3600

  ## Examples

      iex> TimeBySeconds.calculate(3600)
      "01:00:00"

  """
  def calculate(seconds) when seconds >= @one_hour_in_seconds do
    value = seconds / @one_hour_in_seconds

    hour =
      value
      |> Processor.main()

    minutes =
      value
      |> Processor.secondary()

    seconds =
      (seconds / @one_minute_in_seconds)
      |> Processor.secondary()

    Formatter.show([hour, minutes, seconds])
  end
end
