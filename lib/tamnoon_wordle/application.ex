defmodule TamnoonWordle.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Tamnoon,
       [
         [
           router: TamnoonWordle.Router,
           initial_state: %{
            current_guess: "",
            allow_submit: false,
            current_guess_attempt: 0,
            target_word: "HELLO",
            game_over: false
           },
           methods_modules: [TamnoonWordle.Methods.GameMethods]
         ]
       ]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TamnoonWordle.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
