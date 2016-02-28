defmodule SecFilingPageBreakCounter do

  def page_break_count(string) do
    string
    |> String.split("page-break-after")
    |> length
  end
end
