import 'dart:convert';

class UserData {
  String userName;
  String profileImageURL;
  UserData({
    required this.userName,
    required this.profileImageURL,
  });

  UserData copyWith({
    String? userName,
    String? profileImageURL,
  }) {
    return UserData(
      userName: userName ?? this.userName,
      profileImageURL: profileImageURL ?? this.profileImageURL,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userName': userName});
    result.addAll({'profileImageURL': profileImageURL});

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userName: map['userName'] ?? '',
      profileImageURL: map['profileImageURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserData(userName: $userName, profileImageURL: $profileImageURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.userName == userName &&
        other.profileImageURL == profileImageURL;
  }

  @override
  int get hashCode => userName.hashCode ^ profileImageURL.hashCode;
}
