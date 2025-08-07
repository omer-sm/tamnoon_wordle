defmodule TamnoonWordle.Components.GuessGrid.GuessGridCell do
  @behaviour Tamnoon.Component

  def heex() do
    ~S"""
    <div
      class="np-element np-square-md mx-1"
      id="guess-cell-<%= @row %>-<%= @col %>"
    ></div>
    """
  end
end
