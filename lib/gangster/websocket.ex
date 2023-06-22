defmodule Gangster.Websocket do
  @moduledoc false

  @behaviour WebSock

  require Logger

  @impl true
  def init(_) do
    Logger.info("Starting websocket")
    {:ok, nil}
  end

  @impl true
  def handle_in({message, [opcode: :text]}, state) do
    case Jason.decode(message) do
      {:ok, _} ->
        Logger.info("Incoming message #{inspect(message)} could be parsed as JSON")
        {:push, {:text, "ok"}, state}

      {:error, _} ->
        Logger.warn("Incoming message #{inspect(message)} could NOT be parsed as JSON")
        {:stop, :normal, state}
    end
  end

  @impl true
  def handle_info(_message, state) do
    {:ok, state}
  end

  @impl true
  def terminate(reason, _state) do
    Logger.error("Terminating websocket: #{inspect(reason)}")
    :ok
  end
end
