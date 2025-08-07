defmodule TamnoonWordle.Components.GuessGrid.GuessGrid do
  @behaviour Tamnoon.Component

  def heex() do
    ~S"""
    <%= for row <- 0..4 do %>
      <%= r.([TamnoonWordle.Components.GuessGrid.GuessGridRow, %{row: row}]) %>
    <% end %>
    """
  end
end
