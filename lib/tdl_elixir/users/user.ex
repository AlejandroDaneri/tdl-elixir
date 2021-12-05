defmodule TdlElixir.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  alias TdlElixir.Tickets.Ticket

  schema "users" do
    field :role, :string, null: false, default: "standard"
    # many_to_many :events, TdlElixir.Event.Event, join_through: TdlElixir.Tickets.Ticket
    has_many :tickets, Ticket

    pow_user_fields()

    timestamps()
  end

  @spec changeset_role(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(standard admin))
  end
end
