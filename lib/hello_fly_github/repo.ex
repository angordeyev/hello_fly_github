defmodule HelloFlyGithub.Repo do
  use Ecto.Repo,
    otp_app: :hello_fly_github,
    adapter: Ecto.Adapters.Postgres
end
