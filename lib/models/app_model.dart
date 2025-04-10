class AppModel {
  final String image;
  final String phoneNumber;
  final String name;
  final String lastName;
  final String bio;
  final bool isDark;

  AppModel({
    required this.image,
    required this.phoneNumber,
    required this.name,
    required this.lastName,
    required this.bio,
    required this.isDark,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      image: json['image'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      lastName: json['lastName'],
      bio: json['bio'],
      isDark: json['isDark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'phoneNumber': phoneNumber,
      'name': name,
      'lastName': lastName,
      'bio': bio,
      'isDark': isDark,
    };
  }

  AppModel copyWith({
    String? image,
    String? phoneNumber,
    String? name,
    String? lastName,
    String? bio,
    bool? isDark,
  }) {
    return AppModel(
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      isDark: isDark ?? this.isDark,
    );
  }
}
