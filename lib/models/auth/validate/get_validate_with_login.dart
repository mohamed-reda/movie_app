class GetValidateWithLogin {
  GetValidateWithLogin({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });
  late final bool success;
  late final String expiresAt;
  late final String requestToken;

  GetValidateWithLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    expiresAt = json['expires_at'];
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['expires_at'] = expiresAt;
    _data['request_token'] = requestToken;
    return _data;
  }
}
//
//{
//     "success": true,
//     "expires_at": "2022-03-16 11:16:16 UTC",
//     "request_token": "cb0c60049db40c834e30b3522d0683f78d08e58a"
// }
