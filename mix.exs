defmodule SecFilingPageBreakCounter.Mixfile do
  use Mix.Project

  def project do
    [app: :sec_filing_page_break_counter,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications:
      [
        :httpoison,
        :logger,
        :sec_recent_filings_rss_feed_parser
      ]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:sec_recent_filings_rss_feed_parser, "~> 0.0.1"}
    ]
  end
end
