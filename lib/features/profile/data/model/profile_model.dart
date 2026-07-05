class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String? imageUrl;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'image_url': imageUrl};
  }

  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
