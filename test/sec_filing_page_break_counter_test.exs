defmodule SecFilingPageBreakCounterTest do
  use ExUnit.Case
  doctest SecFilingPageBreakCounter

  test "#page_break_count returns the count of page breaks in an HTML document" do
    string = File.read!("test/fixtures/nflx.txt")

    count = string |> SecFilingPageBreakCounter.page_break_count
    assert count == 67
  end
end
