defmodule DocsetApi.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use DocsetApi.Web, :controller
      use DocsetApi.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def static_paths do
    [
      "assets",
      "fonts",
      "images",
      "robots.txt",
      "site.webmanifest",
      "android-chrome-192x192.png",
      "android-chrome-512x512.png",
      "apple-touch-icon.png",
      "favicon-16x16.png",
      "favicon-32x32.png",
      "mstile-70x70.png",
      "mstile-144x144.png",
      "mstile-150x150.png",
      "mstile-310x150.png",
      "mstile-310x310.png",
      "safari-pinned-tab.svg",
      "favicon.ico",
      "browserconfig.xml"
    ]
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias DocsetApi.Repo

      import DocsetApi.Router.Helpers
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/docset_api_web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import DocsetApi.Router.Helpers
      import DocsetApi.ErrorHelpers
    end
  end

  def html do
    quote do
      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      # Include general helpers for rendering HTML
      unquote(html_helpers())
    end
  end

  defp html_helpers do
    quote do
      # HTML escaping functionality
      import Phoenix.HTML

      # Shortcut for generating JS commands
      alias Phoenix.LiveView.JS

      # Routes generation with the ~p sigil
      unquote(verified_routes())
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: DocsetApi.Endpoint,
        router: DocsetApi.Router,
        statics: DocsetApi.Web.static_paths()
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
