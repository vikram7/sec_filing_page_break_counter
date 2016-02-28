defmodule SecFilingPageBreakCounterTest do
  use ExUnit.Case
  doctest SecFilingPageBreakCounter

  test "#page_break_counts returns a map of counts of different kinds of page breaks in an HTML document" do
    string = File.read!("test/fixtures/nflx.txt")

    counts = string |> SecFilingPageBreakCounter.page_break_counts

    assert counts ==
      %{
        pba: 66,
        pbb: 0,
        pba_caps: 0,
        pbb_caps: 0
      }
  end
end
