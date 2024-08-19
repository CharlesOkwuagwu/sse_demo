defmodule SseDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    ThousandIsland.Logger.attach_logger(:trace)
    Bandit.Logger.attach_logger(:info)

    children = [
      {Bandit,
       plug: SseDemo,
       scheme: :https,
       port: 9090,
       certfile: Application.app_dir(:sse_demo, "priv/cert.pem"),
       keyfile: Application.app_dir(:sse_demo, "priv/cert.key")}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SseDemo.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
