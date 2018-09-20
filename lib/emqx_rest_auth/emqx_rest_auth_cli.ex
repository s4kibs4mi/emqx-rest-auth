defmodule EmqxRestAuth.Cli do

  def hook_add(a, b, c) do
    :emqttd_hooks.add(a, b, c)
  end

  def hook_del(a, b) do
    :emqttd_hooks.delete(a, b)
  end

  def load(env) do
    hook_add(:"message.publish", &EmqxRestAuth.Cli.on_message_publish/2, [env])
    hook_add(:"message.delivered", &EmqxRestAuth.Cli.on_message_delivered/4, [env])
    hook_add(:"message.acked", &EmqxRestAuth.Cli.on_message_acked/4, [env])
    hook_add(:"client.connected", &EmqxRestAuth.Cli.on_client_connected/3, [env])
    hook_add(:"client.subscribe", &EmqxRestAuth.Cli.on_client_subscribe/4, [env])
    hook_add(:"client.unsubscribe", &EmqxRestAuth.Cli.on_client_unsubscribe/4, [env])
    hook_add(:"client.disconnected", &EmqxRestAuth.Cli.on_client_disconnected/3, [env])
    hook_add(:"session.subscribed", &EmqxRestAuth.Cli.on_session_subscribed/4, [env])
    hook_add(:"session.unsubscribed", &EmqxRestAuth.Cli.on_session_unsubscribed/4, [env])
  end

  def unload do
    hook_del(:"message.publish", &EmqxRestAuth.Cli.on_message_publish/2)
    hook_del(:"message.delivered", &EmqxRestAuth.Cli.on_message_delivered/4)
    hook_del(:"message.acked", &EmqxRestAuth.Cli.on_message_acked/4)
    hook_del(:"client.connected", &EmqxRestAuth.Cli.on_client_connected/3)
    hook_del(:"client.subscribe", &EmqxRestAuth.Cli.on_client_subscribe/4)
    hook_del(:"client.unsubscribe", &EmqxRestAuth.Cli.on_client_unsubscribe/4)
    hook_del(:"client.disconnected", &EmqxRestAuth.Cli.on_client_disconnected/3)
    hook_del(:"session.subscribed", &EmqxRestAuth.Cli.on_session_subscribed/4)
    hook_del(:"session.unsubscribed", &EmqxRestAuth.Cli.on_session_unsubscribed/4)
  end

  def on_message_publish(message, _env) do
    IO.inspect(["emqx_rest_auth on_message_publish", message])
    {:ok, message}
  end

  def on_message_delivered(clientId, username, message, _env) do
    IO.inspect(["emqx_rest_auth on_message_delivered", clientId, username, message])
    :ok
  end

  def on_message_acked(clientId, username, message, _env) do
    IO.inspect(["emqx_rest_auth on_message_acked", clientId, username, message])
    :ok
  end

  def on_client_connected(returncode, client, _env) do
    IO.inspect(["emqx_rest_auth on_client_connected", client, returncode, client])
    :ok
  end

  def on_client_disconnected(error, client, _env) do
    IO.inspect(["emqx_rest_auth on_client_disconnected", error, client])
    :ok
  end

  def on_client_subscribe(clientid, username, topictable, _env) do
    IO.inspect(["emqx_rest_auth on_client_subscribe", clientid, username, topictable])
    {:ok, topictable}
  end

  def on_client_unsubscribe(clientid, username, topictable, _env) do
    IO.inspect(["emqx_rest_auth on_client_unsubscribe", clientid, username, topictable])
    {:ok, topictable}
  end

  def on_session_subscribed(clientid, username, topicitem, _env) do
    IO.inspect(["emqx_rest_auth on_session_subscribed", clientid, username, topicitem])
    {:ok, topicitem}
  end

  def on_session_unsubscribed(clientid, username, topicitem, _env) do
    IO.inspect(["emqx_rest_auth on_session_unsubscribed", clientid, username, topicitem])
    {:ok, topicitem}
  end
end
