defmodule SecFilingPageBreakCounter do

  def page_break_counts(string) do
    pba = string
    |> String.split("page-break-after")
    |> length
    |> - 1

    pbb = string
    |> String.split("page-break-before")
    |> length
    |> - 1

    pba_caps = string
    |> String.split("PAGE-BREAK-AFTER")
    |> length
    |> - 1

    pbb_caps = string
    |> String.split("PAGE-BREAK-BEFORE")
    |> length
    |> - 1

    %{
      pba: pba,
      pbb: pbb,
      pba_caps: pba_caps,
      pbb_caps: pbb_caps
    }
  end
end
