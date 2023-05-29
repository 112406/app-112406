class UserRegisterReq {
  String? username;
  String? password;

  UserRegisterReq({this.username, this.password});

  factory UserRegisterReq.fromJson(Map<String, dynamic> json) {
    return UserRegisterReq(
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
