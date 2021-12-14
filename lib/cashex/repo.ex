defmodule Cashex.Repo do
  use Ecto.Repo,
    otp_app: :cashex,
    adapter: Ecto.Adapters.Postgres
end
