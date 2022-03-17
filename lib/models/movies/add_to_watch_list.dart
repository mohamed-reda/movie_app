class AddToWatchList {
  AddToWatchList({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });
  late final bool success;
  late final int statusCode;
  late final String statusMessage;

  AddToWatchList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['status_message'] = statusMessage;
    return _data;
  }
}

// https://api.themoviedb.org/3/account/12087808/watchlist?api_key=31521ab741626851b73c684539c33b5a&session_id=b3a95741fac256ff4ff02b28b1062c7d7555511e
