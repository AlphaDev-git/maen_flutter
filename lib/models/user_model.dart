class UserModel {
  final String id;
  final String name;
  final String email;
  final String firebaseUid;
  final String role;
  final String status;
  final String language;
  final String currency;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.firebaseUid,
    required this.role,
    required this.status,
    required this.language,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });

  /// 🧩 Create model from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      firebaseUid: json['firebaseUid'] ?? '',
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      language: json['language'] ?? 'en',
      currency: json['currency'] ?? 'EGP',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  /// 🔄 Convert model to JSON (optional, for saving locally)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'firebaseUid': firebaseUid,
      'role': role,
      'status': status,
      'language': language,
      'currency': currency,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, role: $role)';
  }
}
