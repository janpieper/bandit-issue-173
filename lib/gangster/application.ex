defmodule Gangster.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [Gangster.Endpoint]
    opts = [strategy: :one_for_one, name: Gangster.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
