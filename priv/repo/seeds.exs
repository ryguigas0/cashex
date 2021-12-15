# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

# alias Cashex.{Transactions, Rules}

# Create an Rule
# {:ok, rule_a} = Rules.Create.call(%{desc: "Gamers discount", bon: 22.5})

# rule_a_id =
#   rule_a
#   |> Map.get(:id)
#   |> IO.inspect(label: "Test rule_a id")

# {:ok, rule_b} = Rules.Create.call(%{desc: "Speedrunners discount", bon: 23.5})

# rule_b_id =
#   rule_b
#   |> Map.get(:id)
#   |> IO.inspect(label: "Test rule_b id")

# {:ok, rule_c} = Rules.Create.call(%{desc: "Gamer Journalists discount", bon: 21.5})

# rule_c_id =
#   rule_c
#   |> Map.get(:id)
#   |> IO.inspect(label: "Test rule_c id")

# # Create an Transaction for reciveing cashback
# {:ok, transaction_pos} =
#   Transactions.Create.call(%{value: 59.99, user_cpf: "12345678912", rule_id: rule_a_id})

# transaction_pos
# |> Map.get(:id)
# |> IO.inspect(label: "Test transaction id")

# Rule for spending cashback
# Rules.Create.call(%{desc: "FULL CASHBACK", bon: 100})

# rule_spend =
#   rule_spend
#   |> Map.get(:id)
#   |> IO.inspect(label: "SPENDING CASHBACK RULE")

# {:ok, transaction_neg} = Transactions.Create.call(%{value: -10, user_cpf: "12345678912", rule_id: rule_spend})

# transaction_neg
# |> Map.get(:id)
# |> IO.inspect(label: "Test transaction_neg id")
