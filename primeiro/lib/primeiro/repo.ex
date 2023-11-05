defmodule Primeiro.Repo do
  use Ecto.Repo,
    otp_app: :primeiro,
    adapter: Ecto.Adapters.Postgres
end
