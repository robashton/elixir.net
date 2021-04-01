defmodule Eg do
  use Application

  def start(_type, _args) do

    { :ok, result } = :dotnet.run_app_from_assembly(to_charlist("cs/bin/Debug/net5.0/Eg.dll"), to_charlist("Eg.App"), { 5, 3 })

    IO.puts "What a result: #{result}"

    :dotnet.run_app_from_assembly(to_charlist("cs/bin/Debug/net5.0/Eg.dll"), to_charlist("Eg.Gen"), %{ :foo => 1, :bar => 2 })
  end
end
