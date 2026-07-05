class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? photoUrl;
  final bool premium;
  final bool emailVerified;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.photoUrl,
    this.premium = false,
    this.emailVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'premium': premium,
      'emailVerified': emailVerified,
      'createdAt': DateTime.now(),
      'lastLogin': DateTime.now(),
    };
  }
}