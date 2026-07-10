# Changelog

## v0.5.2 (2026-07-10)

* Feat: upgrade plug

## v0.5.1 (2026-05-06)

* Feat: upgrade plug and tesla

## v0.5.0 (2026-05-05)

* Raise minimum Elixir requirement to `~> 1.14`
* Update dependencies: tesla `~> 1.9`, finch `~> 0.19`, jason `~> 1.4`, plug `~> 1.16`, ex_doc `~> 0.34`
* Fix all deprecated multi-line string interpolation syntax (compiler warnings in Elixir 1.14+)
* Fix docs typo: "BeHaviour" → "Behaviour" in module group label
* Replace `Mix.env()` check in `config.exs` with `config_env()` and split into per-environment config files
* Suppress logger output in test environment

## v0.4.6 (2022-11-22)

* Fix `WeChat.Storage.Adapter.DefaultComponentClient.refresh_component_access_token/3` undefined when occur access token expired
  in client side.

## v0.4.5 (2021-10-14)

* Simplify dependency by removing `:timex`.

## v0.4.4 (2021-06-02)

* Fix OTP24 warning internally used tesla/httpc when ssl connect to self-hub, now use
  tesla finch adapter for all http requests

## v0.4.3 (2021-05-27)

* Fix authorizer_appid was mistaken for component appid when set appid param in query string
* Fix no function clause matching when access_token is invalid in some case

## v0.4.2 (2021-03-03)

* Fix input invalid `access_token` when call sns userinfo and auth API made infinity retry

## v0.4.1 (2021-02-08)

* Fix some cases fail to get component `access_token` from hub [#8](https://github.com/edragonconnect/elixir_wechat/pull/8)

## v0.4.0 (2021-01-15)

* Fix Elixir 1.11 compilation warnings

## v0.3.1 (2020-12-16)

* Fix WeChat.Registry to use :ets as a global storage instead of Elixir Registry

## v0.3.0 (2020-12-16)

* Add local registry for `access_token` and `ticket` in client to effectively call WeChat functional API
* Use `Tesla.Middleware.Retry` for http socket closed/timeout
* Use `Tesla.Adapter.Finch` to process http request/response
* Fix http middleware rerun was using unexpected `Tesla.Env`
* Fix adapter storage validation in WeChat common application
* Change the reason field of `WeChat.Error` struct from atom to string
