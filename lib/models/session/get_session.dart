class GetSession {
  GetSession({
    required this.success,
    required this.sessionId,
  });
  late final bool success;
  late final String sessionId;

  GetSession.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['session_id'] = sessionId;
    return _data;
  }
}
// {
// "success": true,
// "session_id": "f807818aa0fa1e2082c76767ba56c3771e1e0b9d"
// Session denied
// }

//{
//     "success": false,
//     "failure": true,
//     "status_code": 17,
//     "status_message": "Session denied."
// }
