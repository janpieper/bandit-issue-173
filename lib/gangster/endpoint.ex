defmodule Gangster.Endpoint do
  @moduledoc false

  @spec child_spec(opts :: Keyword.t()) :: Supervisor.child_spec()
  def child_spec(_opts) do
    config = Application.fetch_env!(:gangster, __MODULE__)

    %{
      id: __MODULE__,
      start: {Bandit, :start_link, [config]},
      restart: :permanent
    }
  end
end
