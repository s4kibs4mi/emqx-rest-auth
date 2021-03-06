defmodule EmqxRestAuth do
  use Application

  def start(_type, _args) do
    EmqxRestAuth.Cli.load([])
    EmqxRestAuth.Acl.load([])
    EmqxRestAuth.Supervisor.start_link()
  end

  def stop(_app) do
    EmqxRestAuth.Cli.unload()
    EmqxRestAuth.Acl.unload()
  end
end
