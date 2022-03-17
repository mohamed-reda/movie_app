class SendValidateWithLogin {
  SendValidateWithLogin({
    required this.username,
    required this.password,
    required this.requestToken,
  });
  late final String username;
  late final String password;
  late final String requestToken;

  SendValidateWithLogin.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['request_token'] = requestToken;
    return _data;
  }
}
//post
//https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=31521ab741626851b73c684539c33b5a
//{
//   "username": "mohamed.reda.vod",
//   "password": "mohamed.reda.vod@gmail.com",
//   "request_token": "cb0c60049db40c834e30b3522d0683f78d08e58a"
// }
