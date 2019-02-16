defmodule TimeBySecondsTest do
  use ExUnit.Case
  doctest TimeBySeconds

  test "should be shown right format to 0 hour, 0 minutes and 0 seconds when pass zero" do
    result = TimeBySeconds.calculate(0)
    assert "00:00:00" == result
  end

  test "should be shown right 0 hour, 0 minutes and 0 seconds when pass negative number" do
    result = TimeBySeconds.calculate(-10)
    assert "00:00:00" == result
  end

  test "should be shown right 0 hour, 0 minutes and 20 seconds" do
    result = TimeBySeconds.calculate(20)
    assert "00:00:20" == result
  end

  test "should be shown right 0 hour, 0 minutes and 40 seconds" do
    result = TimeBySeconds.calculate(40)
    assert "00:00:40" == result
  end

  test "should be shown right minutes" do
    result = TimeBySeconds.calculate(70)
    assert "00:01:10" == result
  end

  test "should be shown right 01 minute and 20 seconds" do
    result = TimeBySeconds.calculate(80)
    assert "00:01:20" == result
  end

  test "should be shown right 50 minutes and 0 seconds" do
    result = TimeBySeconds.calculate(3000)
    assert "00:50:00" == result
  end

  test "should be shown right 59 minutes and 59 seconds" do
    result = TimeBySeconds.calculate(3599)
    assert "00:59:59" == result
  end

  test "should be shown right 1 hour, 0 minutes and 0 seconds" do
    result = TimeBySeconds.calculate(3600)
    assert "01:00:00" == result
  end

  test "should be shown right 1 hour, 20 minutes and 0 seconds" do
    result = TimeBySeconds.calculate(4800)
    assert "01:20:00" == result
  end

  test "should be shown right 1 hour, 40 minutes and 0 seconds" do
    result = TimeBySeconds.calculate(6000)
    assert "01:40:00" == result
  end

  test "should be shown right 1 hour, 45 minutes and 20 seconds" do
    result = TimeBySeconds.calculate(6320)
    assert "01:45:19" == result
  end

  test "should be shown right 1 hour, 45 minutes and 55 seconds" do
    result = TimeBySeconds.calculate(6355)
    assert "01:45:55" == result
  end

  test "should be shown right 2 hour, 46 minutes and 20 seconds" do
    result = TimeBySeconds.calculate(9980)
    assert "02:46:20" == result
  end
end
