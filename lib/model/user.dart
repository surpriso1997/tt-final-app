class Useer {
  final String id, email;
  final String? displayName, photoUrl;

  Useer({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  factory Useer.fromJson(Map json) {
    return Useer(
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'email': email,
      "displayName": displayName,
      "photUrl": photoUrl
    };
  }
}
