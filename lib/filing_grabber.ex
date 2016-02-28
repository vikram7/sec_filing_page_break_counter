defmodule SecFilingPageBreakCounter.FilingGrabber do
  use HTTPoison.Base

  @endpoint "https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=10-K&company=&dateb=&owner=include&start=0&count=100&output=atom"

  def entries_from_feed do
    feed = File.read!("priv/data/filings_atom_feed.xml")
    |> SecLatestFilingsRssFeedParser.parse!
    feed.entries
  end

  def inspect_entry(entry) do
    IO.puts "Inspecting #{entry.title}"
    response = entry.link |> HTTPoison.get!
    response.body |> SecFilingPageBreakCounter.page_break_count
  end
end
