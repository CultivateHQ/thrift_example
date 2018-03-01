defmodule(Thrift.Test.UserService.Handler) do
  @callback(delete_user(user_id :: Thrift.i64()) :: boolean())
  @callback(get_user_by_id(user_id :: Thrift.i64()) :: %Thrift.Test.User{})
  @callback(ping() :: boolean())
end