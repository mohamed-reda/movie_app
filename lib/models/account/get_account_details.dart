class GetAccountDetails {
  GetAccountDetails({
    this.avatar,
    this.id = 1,
    this.iso_639_1 = '',
    this.iso_3166_1 = '',
    this.name = '',
    this.includeAdult = false,
    this.username = '',
  });
  Avatar? avatar;
  late final int id;
  late final String iso_639_1;
  late final String iso_3166_1;
  late final String name;
  late final bool includeAdult;
  late final String username;

  GetAccountDetails.fromJson(Map<String, dynamic> json) {
    avatar = Avatar.fromJson(json['avatar']);
    id = json['id'];
    iso_639_1 = json['iso_639_1'];
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
    includeAdult = json['include_adult'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['avatar'] = avatar?.toJson();
    _data['id'] = id;
    _data['iso_639_1'] = iso_639_1;
    _data['iso_3166_1'] = iso_3166_1;
    _data['name'] = name;
    _data['include_adult'] = includeAdult;
    _data['username'] = username;
    return _data;
  }
}

class Avatar {
  Avatar({
    required this.gravatar,
    required this.tmdb,
  });
  late final Gravatar gravatar;
  late final Tmdb tmdb;

  Avatar.fromJson(Map<String, dynamic> json) {
    gravatar = Gravatar.fromJson(json['gravatar']);
    tmdb = Tmdb.fromJson(json['tmdb']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar'] = gravatar.toJson();
    _data['tmdb'] = tmdb.toJson();
    return _data;
  }
}

class Gravatar {
  Gravatar({
    required this.hash,
  });
  late final String hash;

  Gravatar.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hash'] = hash;
    return _data;
  }
}

class Tmdb {
  Tmdb({
    this.avatarPath,
  });
  late final Null avatarPath;

  Tmdb.fromJson(Map<String, dynamic> json) {
    avatarPath = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['avatar_path'] = avatarPath;
    return _data;
  }
}
// https://api.themoviedb.org/3/account?api_key=31521ab741626851b73c684539c33b5a&session_id=b3a95741fac256ff4ff02b28b1062c7d7555511e
