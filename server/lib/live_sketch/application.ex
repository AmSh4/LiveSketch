defmodule LiveSketch.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: LiveSketch.PubSub},
      LiveSketchWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: LiveSketch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    LiveSketchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
