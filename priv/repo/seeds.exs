# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cashex.Repo.insert!(%Cashex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cashex.{Purchases, Rules}

# Create an Rule
{:ok, rule} = Rules.Create.call(%{desc: "Gamers dicount", bon: 22.5})

rule_id =
  rule
  |> Map.get(:id)
  |> IO.inspect(label: "Test rule id")

# Create an Purchase
{:ok, purchase} = Purchases.Create.call(59.99, "12345678912", rule_id)

purchase
|> Map.get(:id)
|> IO.inspect(label: "Test purchase id")
