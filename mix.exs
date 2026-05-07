defmodule WeChat.MixProject do
  use Mix.Project

  @source_url "https://github.com/jolee2014/elixir_wechat_fork"
  @homepage_url "https://github.com/jolee2014/elixir_wechat_fork"

  def project do
    [
      app: :elixir_wechat_fork,
      version: "0.5.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      source_url: @source_url,
      homepage_url: @homepage_url
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {WeChat.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:tesla, "~> 1.17"},
      {:finch, "~> 0.19"},
      {:jason, "~> 1.4"},
      {:decorator, "~> 1.4"},
      {:plug, "~> 1.19", optional: true},
      {:mock, "~> 0.3", only: :test},
      {:ex_doc, "~> 0.34", only: [:docs, :dev], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      formatter_opts: [gfm: true],
      extras: [
        "README.md"
      ],
      groups_for_modules: [
        {
          "Behaviour",
          [
            WeChat.Storage.Client,
            WeChat.Storage.Hub,
            WeChat.Storage.ComponentClient,
            WeChat.Storage.ComponentHub
          ]
        },
        {
          "Default Storage Client to Hub",
          [
            WeChat.Storage.Adapter.DefaultClient,
            WeChat.Storage.Adapter.DefaultComponentClient
          ]
        },
        {
          "Meta",
          [
            WeChat.CardSignature,
            WeChat.JSSDKSignature,
            WeChat.Token,
            WeChat.Error
          ]
        },
        {
          "Meta Upload",
          [
            WeChat.UploadMedia,
            WeChat.UploadMediaContent
          ]
        }
      ]
    ]
  end

  defp description() do
    "WeChat SDK for Elixir. Community-maintained fork of elixir_wechat, 
    created to keep compatibility and updates after the original project became inactive."
  end

  defp package do
    [
      name: "elixir_wechat_fork",
      files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
      maintainers: ["jolee2014"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Original Project" => "https://github.com/edragonconnect/elixir_wechat",
        "Changelog" => "#{@source_url}/blob/main/CHANGELOG.md"
      },
    ]
  end
end
