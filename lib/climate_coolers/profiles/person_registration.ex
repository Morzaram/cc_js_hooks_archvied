defmodule ClimateCoolers.Profiles.PersonRegistration do
  use Ecto.Schema
  import Ecto.Changeset
  alias ClimateCoolers.Profiles.{PersonRegistration}

  defmodule Link do
    use Ecto.Schema

    embedded_schema do
      field :url, :string
    end
  end

  defmodule Image do
    use Ecto.Schema

    embedded_schema do
      field :url, :string
    end
  end

  embedded_schema do
    embeds_one :profile, ClimateCoolers.Profiles.PersonProfile do
      field :name, :string
      field :birthdate, :date
      field :description, :string
    end

    embeds_many :links, Link do
      field :url, :string
    end

    embeds_many :pics, Image do
      field :url, :string
    end
  end

  def changeset(%PersonRegistration{} = person_registration, attrs) do
    person_registration
    |> cast(attrs, [])
    |> cast_embed(:links)
    |> cast_embed(:profile)
    |> cast_embed(:pics)
    |> validate_required([])
  end
end
