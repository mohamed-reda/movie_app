class SendSession {
  SendSession({
    required this.requestToken,
  });
  late final String requestToken;

  SendSession.fromJson(Map<String, dynamic> json) {
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['request_token'] = requestToken;
    return _data;
  }
}
//https://api.themoviedb.org/3/authentication/session/new?api_key=31521ab741626851b73c684539c33b5a
