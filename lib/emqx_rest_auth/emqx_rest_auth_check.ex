defmodule EmqxRestAuth.Check do

  def load(env) do
    :emqttd_access_control.register_mod(:auth, EmqxRestAuth.Check, [])
  end

  def unload do
    :emqttd_access_control.unregister_mod(:auth, EmqxRestAuth.Check)
  end

  def init(_opts) do
    IO.puts("On Auth init")
    {:ok, _opts}
  end

  def check(client, password, _opts) do
    IO.puts("OnAuth check")
    #    {:ignore}
    #    {:error, "Error happend"}
    {:ok, false}
  end

  def description() do
    "Emqx Res Auth Description"
  end

end
