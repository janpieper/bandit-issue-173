defmodule Gangster.Router do
  @moduledoc false

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/ws" do
    Plug.Conn.upgrade_adapter(
      conn,
      :websocket,
      {Gangster.Websocket, nil, []}
    )
  end

  match _ do
    conn
    |> put_resp_header("content-type", "text/plain")
    |> send_resp(:not_found, "Not Found")
    |> halt()
  end
end
