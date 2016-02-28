defmodule SecFilingPageBreakCounterFilingGrabberTest do
  use ExUnit.Case

  test "#retrieve_filing_entries returns a list of maps" do
    entries = SecFilingPageBreakCounter.FilingGrabber.retrieve_filing_entries
    count = length entries
    assert count == 200
  end
end
