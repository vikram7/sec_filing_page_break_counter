# SecFilingPageBreakCounter

There is no standardized document format to SEC filings. In fact, something as innocuous as page breaks in documents are done in a variety of ways depending on the filer. This small tool calculates the page break method that a company filer uses along with a page count based on the page break method used.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add sec_filing_page_break_counter to your list of dependencies in `mix.exs`:

        def deps do
          [{:sec_filing_page_break_counter, "~> 0.0.1"}]
        end

  2. Ensure sec_filing_page_break_counter is started before your application:

        def application do
          [applications: [:sec_filing_page_break_counter]]
        end

## License

This library is under the MIT [license](LICENSE.md).
