defmodule CashexWeb.ErrorFallbackController do
  use CashexWeb, :controller

  alias CashexWeb.ErrorView

  def call(conn, {:error, {:invalid_changeset, changeset}}) do
    send_response(conn, :bad_request, "bad_changeset.json", %{changeset: changeset})
  end

  def call(conn, {:error, :invalid_data}) do
    send_response(conn, :not_found, "error_msg.json", %{message: "Invalid data"})
  end

  def call(conn, {:error, :user_not_found}) do
    send_response(conn, :ok, "error_msg.json", %{message: "User not found"})
  end

  def call(conn, {:error, :link_not_found}) do
    send_response(conn, :ok, "error_msg.json", %{message: "Link not found"})
  end

  def call(conn, {:error, :cashback_not_float_value}) do
    send_response(conn, :bad_request, "error_msg.json", %{message: "Cashback is not float value"})
  end

  def call(conn, {:error, :cashback_0_value}) do
    send_response(conn, :bad_request, "error_msg.json", %{
      message: "Cashback must be greater than 0.0"
    })
  end

  defp send_response(conn, status, template, assigns) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render(template, assigns)
  end
end
