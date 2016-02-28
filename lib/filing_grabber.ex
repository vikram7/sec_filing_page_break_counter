defmodule SecFilingPageBreakCounter.FilingGrabber do
  use HTTPoison.Base

  @endpoint "https://www.sec.gov/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=10-K&company=&dateb=&owner=include&start=0&count=100&output=atom"

  def entries_from_feed do
    feed = File.read!("priv/data/filings_atom_feed.xml")
    |> SecLatestFilingsRssFeedParser.parse!
    feed.entries
  end

  def convert_sec_url_link_to_txt(link) do
    link |> String.replace("-index.htm", ".txt")
  end

  def inspect_entries, do: inspect_entries(entries_from_feed)
  def inspect_entries([]), do: :ok
  def inspect_entries([entry|rest_of_entries]) do
    entry |> inspect_entry
    rest_of_entries |> inspect_entries
  end

  def inspect_entry(entry) do
    IO.puts "Inspecting #{entry.title}"
    response =
      entry.link
      |> convert_sec_url_link_to_txt
      |> HTTPoison.get!
    counts = response.body |> SecFilingPageBreakCounter.page_break_counts
    write_inspected_entry(entry.title, counts)
  end

  defp write_inspected_entry(title, counts) do
    {:ok, file} = File.open("priv/data/counts.csv", [:append, :utf8])
    IO.puts(file, "#{title},#{counts.pba},#{counts.pbb},#{counts.pba_caps},#{counts.pbb_caps}")
    IO.puts("Wrote #{title} to CSV!")
  end
end
