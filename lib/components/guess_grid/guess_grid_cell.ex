defmodule TamnoonWordle.Components.GuessGrid.GuessGridCell do
  @behaviour Tamnoon.Component
  alias Tamnoon.DOM

  @color_classes [
    gray: "np-bg-secondary",
    yellow: "np-bg-warning",
    green: "np-bg-success"
  ]

  def heex() do
    ~S"""
    <div
      class="np-element np-square-md mx-1 pe-none text-xl"
      id="guess-cell-<%= @row %>-<%= @col %>"
    ></div>
    """
  end

  def fill_cell(row, col, letter, color) do
    target_cell = DOM.Node.new!(%{
        selector_type: :id,
        selector_value: "guess-cell-#{row}-#{col}"
      })

    change_content_action = DOM.Actions.SetInnerHTML.new!(%{
      target: target_cell,
      value: letter
    })

    change_style_action = DOM.Actions.SetAttribute.new!(%{
      attribute: "class",
      target: target_cell,
      value: "np-element np-square-md mx-1 np-shadow-less pe-none np-3x text-center #{@color_classes[color]}"
    })

    [change_content_action, change_style_action]
  end
end
