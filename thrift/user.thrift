namespace elixir Thrift.Test
exception UserNotFound {
  1: string message
}

struct User {
  1: i64 id,
  2: string username,
  3: string first_name,
  4: string last_name
}

service UserService {
  bool ping(),
  User get_user_by_id(1: i64 user_id) throws (1: UserNotFound unf),
  bool deleteUser(1: i64 userId),
}