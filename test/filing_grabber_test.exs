defmodule SecFilingPageBreakCounterFilingGrabberTest do
  use ExUnit.Case

  test "#retrieve_filing_entries returns a list of 200 maps" do
    entries = SecFilingPageBreakCounter.FilingGrabber.entries_from_feed
    count = length entries
    [entry|_] = entries
    assert count == 199
    assert entry.cik_id
    assert entry.link
  end
end
