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

# Create an Rule
rule =
  %Cashex.Rule{desc: "Gamers discount on walmart", bon: 2.05}
  |> Cashex.Rule.changeset(%{})
  |> Cashex.Repo.insert!()

# Create an Purchase
purchase =
  %Cashex.Purchase{value: 59.99, rule: rule, buyer_cpf: "12345678912"}
  |> Cashex.Purchase.changeset(%{})
  |> Cashex.Repo.insert!()
