// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*
     "username": displayName,
        "email": email,
        "id": uid,
        "photo": photoUrl,
        "userLocation": null
*/
class UserModel {
  final String username;
  final String email;
  final String id;
  final String photo;
  final double? latitude;
  final double? longitude;
  UserModel({
    required this.username,
    required this.email,
    required this.id,
    required this.photo,
    this.latitude,
    this.longitude,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? id,
    String? photo,
    double? latitude,
    double? longitude,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      id: id ?? this.id,
      photo: photo ?? this.photo,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'id': id,
      'photo': photo,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    try {
      return UserModel(
        username: map['username'] ?? "",
        email: map['email'] ?? "",
        id: map['id'] ?? "",
        photo: map['photo'] ?? "",
        latitude: map['latitude'] ?? 0.0,
        longitude: map['longitude'] ?? 0.0,
      );
    } catch (e) {
      throw e.toString();
    }
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, id: $id, photo: $photo, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.id == id &&
        other.photo == photo &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        id.hashCode ^
        photo.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
