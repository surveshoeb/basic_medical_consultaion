import 'dart:convert';

class DoctorData {
  String docName;
  String profileImageURL;
  String description;
  double? rating;
  int? review;

  DoctorData({
    required this.docName,
    required this.profileImageURL,
    required this.description,
    this.rating,
    this.review,
  });

  DoctorData copyWith({
    String? docName,
    String? profileImageURL,
    String? description,
    double? rating,
    int? review,
  }) {
    return DoctorData(
      docName: docName ?? this.docName,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'docName': docName});
    result.addAll({'profileImageURL': profileImageURL});
    result.addAll({'description': description});
    if (rating != null) {
      result.addAll({'rating': rating});
    }
    if (review != null) {
      result.addAll({'review': review});
    }

    return result;
  }

  factory DoctorData.fromMap(Map<String, dynamic> map) {
    return DoctorData(
      docName: map['docName'] ?? '',
      profileImageURL: map['profileImageURL'] ?? '',
      description: map['description'] ?? '',
      rating: map['rating']?.toDouble(),
      review: map['review']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorData.fromJson(String source) =>
      DoctorData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorData(docName: $docName, profileImageURL: $profileImageURL, description: $description, rating: $rating, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorData &&
        other.docName == docName &&
        other.profileImageURL == profileImageURL &&
        other.description == description &&
        other.rating == rating &&
        other.review == review;
  }

  @override
  int get hashCode {
    return docName.hashCode ^
        profileImageURL.hashCode ^
        description.hashCode ^
        rating.hashCode ^
        review.hashCode;
  }
}
