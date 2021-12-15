# Cashex
Elixir powered cashback manager

To start your Cashex server:

1. Install dependencies with `mix deps.get`
2.  Create and migrate your database with `mix ecto.setup`
3.  Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
4. Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# TODO
- Tests
    - Creating rules
    - Creating transactions
        - Spending cashback
        - Recieving cashback
    - Finding rules by matching description
    - Updating rules (must not alter transaction history)
    - Deleting rules (must not alter transaction history)