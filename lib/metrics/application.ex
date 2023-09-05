defmodule Metrics.Application do

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Metrics.Telemetry.ReporterState, {0, 0}},
      Metrics.Telemetry
    ]

    opts = [strategy: :one_for_one, name: Metrics.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
