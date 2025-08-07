defmodule TamnoonWordle.Components.GuessGrid.GuessGridRow do
  @behaviour Tamnoon.Component

  def heex() do
    ~S"""
    <div class="row w-100 justify-content-center my-1">
      <%= for col <- 0..4 do %>
        <%= r.([TamnoonWordle.Components.GuessGrid.GuessGridCell, %{row: @row, col: col}]) %>
      <% end %>
    </div>
    """
  end
end
