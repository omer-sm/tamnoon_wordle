defmodule TamnoonWordle.Components.GameOverMessage do
  @behaviour Tamnoon.Component
  alias Tamnoon.DOM

  @game_won_message "Good job! You have won the game :)"
  @game_lost_message "Out of guesses! Try again next time :)"

  def heex() do
    ~S"""
    <div class="row w-100 justify-content-center my-3" hidden=@not-game_over hidden>
      <div class="w-50 d-flex flex-column p-1 np-shadow-less justify-content-center np-1-5x text-center">
       <p id="game-over-message-content" class="mb-0"></p>
       <p class="mb-0">The answer was: <b class="font-weight-bold">@target_word</b></p>
      </div>
    </div>
    """
  end

  def display_game_over_message(was_game_won) do
    DOM.Actions.SetAttribute.new!(%{
      attribute: "textContent",
      value: (if was_game_won, do: @game_won_message, else: @game_lost_message),
      target: DOM.Node.new!(%{
        selector_type: :id,
        selector_value: "game-over-message-content"
      })
    })
  end
end
