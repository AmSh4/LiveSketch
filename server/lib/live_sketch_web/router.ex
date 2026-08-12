defmodule LiveSketchWeb.Router do
  use LiveSketchWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:put_root_layout, {LiveSketchWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", LiveSketchWeb do
    pipe_through(:browser)
  end

  scope "/api", LiveSketchWeb do
    pipe_through(:api)
  end

  # Note: For channels, handled in socket
end
