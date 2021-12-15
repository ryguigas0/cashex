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

alias Cashex.{Transactions, Rules}

# Create an Rule
{:ok, rule_a} = Rules.Create.call(%{desc: "Gamers discount", bon: 22.5})

rule_a_id =
  rule_a
  |> Map.get(:id)
  |> IO.inspect(label: "Test rule_a id")

{:ok, rule_b} = Rules.Create.call(%{desc: "Speedrunners discount", bon: 23.5})

rule_b_id =
  rule_b
  |> Map.get(:id)
  |> IO.inspect(label: "Test rule_b id")

{:ok, rule_c} = Rules.Create.call(%{desc: "Gamer Journalists discount", bon: 21.5})

rule_c_id =
  rule_c
  |> Map.get(:id)
  |> IO.inspect(label: "Test rule_c id")

# Create an Transaction
{:ok, transaction} = Transactions.Create.call(59.99, "12345678912", rule_a_id)

transaction
|> Map.get(:id)
|> IO.inspect(label: "Test transaction id")
