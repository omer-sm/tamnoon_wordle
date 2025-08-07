defmodule TamnoonWordle.Components.Root do
  @behaviour Tamnoon.Component

  @impl true
  def heex do
    ~s"""
    <!DOCTYPE html>
    <html lang="en">

      <head>
        <meta name="description" content="Webpage description goes here" />
        <meta charset="utf-8">
        <title>Tamnoon Wordle</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="tamnoon/tamnoon_dom.js"></script>
        <script src="tamnoon/tamnoon_driver.js"></script>
        <link rel="icon" type="image/x-icon" href="/tamnoon/tamnoon_icon.ico">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/omer-sm/neumorph.scss@master/dist/css/dark/neumorph-full-dark.min.css">
      </head>

      <body class="vh-100">
        <div class="container-fluid p-0 vh-100 d-flex flex-column">
          <%= r.("ui/topbar.html.heex") %>
          <%= r.("ui/game_container.html.heex") %>
        </div>
      </body>
    </html>
    """
  end
end
