import Config

config :dotnet,
  runtime_config: to_charlist("cs/bin/Debug/net5.0/Eg.runtimeconfig.json"),
  runtime_dll: to_charlist("cs/bin/Debug/net5.0/Erlang.dll")
