defmodule LiveSketchWeb.UserSocket do
  use Phoenix.Socket

  channel "session:*", LiveSketchWeb.SessionChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
