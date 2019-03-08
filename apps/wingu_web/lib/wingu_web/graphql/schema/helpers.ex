defmodule WinguWeb.GraphQL.Helpers do
  def translate_error(%Ecto.Changeset{errors: errors}=_changeset) do
    Enum.map(errors, fn {field, error} ->
      Atom.to_string(field) <> " " <> translate_error(error)
    end)
  end
  def translate_error({msg, opts}) do
    case opts[:count] do
      nil -> Gettext.dgettext(WinguWeb.Gettext, "errors", msg, opts)
      count -> Gettext.dngettext(WinguWeb.Gettext, "errors", msg, msg, count, opts)
    end
  end
end
