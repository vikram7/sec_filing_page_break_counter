defmodule SecFilingPageBreakCounter.FilingGrabber do
  use HTTPoison.Base

  @endpoint "https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=10-K&company=&dateb=&owner=include&start=0&count=100&output=atom"

  def retrieve_filing_entries do
    feed = File.read!("priv/data/filings_atom_feed.xml")
    |> SecLatestFilingsRssFeedParser.parse!
    feed.entries
  end

  def inspect_filing(filing) do
    IO.puts "Inspecting #{filing.title}"
    response = filing.link |> HTTPoison.get!
    counts = response.body |> SecFilingPageBreakCounter.page_break_count
  end
end
