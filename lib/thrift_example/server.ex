defmodule ThriftExample.Server do
  @behaviour Thrift.Test.UserService.Handler
  alias Thrift.Test.User

  def ping, do: true

  def get_user_by_id(user_id) do
    %User{
      id: user_id,
      username: "User #{user_id}",
      first_name: "Mavis #{user_id}",
      last_name: "O'#{user_id}"
    }
  end

  def delete_user(_user_id) do
    :ok
  end
end
