if Code.ensure_loaded?(Plug) do
  defmodule WeChat.Plug.Pipeline do
    @moduledoc false

    use Plug.Builder, copy_opts_to_assign: :wechat_opts
    require Logger

    plug(WeChat.Plug.Router)
  end
end
