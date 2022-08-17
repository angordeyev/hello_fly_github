defmodule HelloFlyGithub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HelloFlyGithub.Repo,
      # Start the Telemetry supervisor
      HelloFlyGithubWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloFlyGithub.PubSub},
      # Start the Endpoint (http/https)
      HelloFlyGithubWeb.Endpoint
      # Start a worker by calling: HelloFlyGithub.Worker.start_link(arg)
      # {HelloFlyGithub.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloFlyGithub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloFlyGithubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
