defmodule TamnoonWordle.Methods.GameMethods do
  import Tamnoon.MethodManager

  defmethod :update_guess do
    current_guess = req["value"]

    processed_guess =
      current_guess
      |> String.trim()
      |> String.upcase()
      |> String.slice(0..4)
      |> String.to_charlist()
      |> Enum.filter(&(?A <= &1 and ?Z >= &1))
      |> to_string()

    row = state[:current_guess_attempt]
    padding = List.duplicate("", 5 - String.length(processed_guess))

    actions =
      processed_guess
      |> String.codepoints()
      |> Enum.concat(padding)
      |> Enum.with_index()
      |> Enum.flat_map(fn {letter, col} ->
        TamnoonWordle.Components.GuessGrid.GuessGridCell.fill_cell(row, col, letter, :none)
      end)

    {%{current_guess: processed_guess, allow_submit: String.length(processed_guess) == 5},
     actions}
  end

  defmethod :submit_guess do
    scored_guess = score_guess(state[:current_guess], state[:target_word])
    row = state[:current_guess_attempt]

    fill_cells_actions =
      scored_guess
      |> Enum.flat_map(fn {letter, color, col} ->
        TamnoonWordle.Components.GuessGrid.GuessGridCell.fill_cell(row, col, letter, color)
      end)

    is_guess_correct = state[:current_guess] == state[:target_word]
    is_game_over = row == 4 || is_guess_correct

    all_actions =
      if is_game_over,
        do:
          fill_cells_actions ++
            [
              TamnoonWordle.Components.GameOverMessage.display_game_over_message(is_guess_correct)
            ],
        else: fill_cells_actions

    {%{
       current_guess: "",
       current_guess_attempt: row + 1,
       allow_submit: false,
       game_over: is_game_over
     }, all_actions}
  end

  defp score_guess(guess, target_word) do
    letter_indices =
      target_word
      |> String.to_charlist()
      |> Enum.with_index()
      |> Enum.reduce(
        %{},
        fn {charcode, index}, acc ->
          Map.get_and_update(acc, charcode, &{&1, [index | &1 || []]}) |> elem(1)
        end
      )

    letters_with_colors =
      guess
      |> String.to_charlist()
      |> Enum.with_index()
      |> Enum.map(fn {charcode, index} ->
        is_in_target = Map.has_key?(letter_indices, charcode)

        is_in_same_place =
          Map.get(letter_indices, charcode, [])
          |> Enum.any?(&(&1 == index))

        letter_color =
          cond do
            is_in_same_place -> :green
            is_in_target -> :yellow
            true -> :gray
          end

        {<<charcode::utf8>>, letter_color, index}
      end)

    letters_with_colors
  end
end
