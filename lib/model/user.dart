class Useer {
  final String id, email, token;
  final String? displayName, photoUrl;

  Useer(
      {required this.id,
      required this.email,
      this.displayName,
      this.photoUrl,
      required this.token});

  // static Useer examppleUser = new Useer(id: "asgweg", email: "test@test.com");

  String get fullName {
    return "John" + " " + "Doe";
  }

  factory Useer.fromJson(Map json) {
    return Useer(
      token: "akjkjbagwegaweg",
      id: json['id'] ?? "",
      email: json['email'] ?? "",
      displayName: json['displayName'],
      photoUrl: json['photoUrl'],
    );

    // return examppleUser;
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      'id': id,
      'email': email,
      "displayName": displayName,
      "photUrl": photoUrl,
    };
  }
}
