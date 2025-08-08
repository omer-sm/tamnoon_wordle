defmodule TamnoonWordle.Components.GuessInput do
  @behaviour Tamnoon.Component

  def heex do
    ~S"""
    <div class="row w-100 justify-content-center my-3" hidden=@game_over>
      <div class="w-50 d-flex flex-row p-3 np-shadow-less">
        <input type="text" id="guess-input"
          class="np-form-element w-100 text-upper-not-placeholder"
          placeholder="Type here.." oninput=@update_guess value=@current_guess>

        <button class="np-btn np-square-sm mx-2 p-0 np-form-element"
        disabled=@not-allow_submit disabled onclick=@submit_guess>&gt;</button>
      </div>
    </div>
    """
  end
end
