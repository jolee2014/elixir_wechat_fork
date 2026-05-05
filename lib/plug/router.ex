if Code.ensure_loaded?(Plug) do
  defmodule WeChat.Plug.Router do
    @moduledoc false

    use Plug.Router, copy_opts_to_assign: :wechat_opts
    alias WeChat.Url

    alias WeChat.Plug.{
      FetchAccessToken,
      RefreshAccessToken,
      FetchComponentAccessToken,
      RefreshComponentAccessToken,
      FetchTicket
    }

    plug(:match)
    plug(:dispatch)

    get Url.to_fetch_access_token() do
      Plug.run(conn, [{FetchAccessToken, conn.assigns.wechat_opts}])
    end

    post Url.to_refresh_access_token() do
      Plug.run(conn, [{RefreshAccessToken, conn.assigns.wechat_opts}])
    end

    get Url.to_fetch_component_access_token() do
      Plug.run(conn, [{FetchComponentAccessToken, conn.assigns.wechat_opts}])
    end

    post Url.to_refresh_component_access_token() do
      Plug.run(conn, [{RefreshComponentAccessToken, conn.assigns.wechat_opts}])
    end

    get Url.to_fetch_ticket() do
      Plug.run(conn, [{FetchTicket, conn.assigns.wechat_opts}])
    end

    match _ do
      conn
    end
  end
end
