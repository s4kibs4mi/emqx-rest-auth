defmodule EmqxRestAuth.Acl do

  def load(env) do
    :emqttd_access_control.register_mod(:acl, EmqxRestAuth.Acl, [])
  end

  def unload do
    :emqttd_access_control.unregister_mod(:acl, EmqxRestAuth.Acl)
  end

  def init(_opts) do
    IO.puts("On Acl init")
    {:ok, _opts}
  end

  def check_acl(client, _opts) do
    IO.puts("OnAcl check_acl")
    #    {:ignore}
    #    {:deny}
    :allow
  end

  def reload_acl(_State) do
    IO.puts("OnReloadAcl reload_acl")
    :ok
  end

  def description() do
    "Emqx Res Acl Description"
  end
end
