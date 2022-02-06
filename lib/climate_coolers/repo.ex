defmodule ClimateCoolers.Repo do
  use Ecto.Repo,
    otp_app: :climate_coolers,
    adapter: Ecto.Adapters.Postgres
end
