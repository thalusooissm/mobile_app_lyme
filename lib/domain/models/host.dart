class Host {
  final int userId; // Primary Key
  final String fullName;
  final String userType;
  final String instaLink;
  final String fbLink;
  final String xLink; // Assuming "x_link" refers to a social link
  final DateTime? birthdate; // Nullable, as birthdate may not always be provided
  final String gender;
  final String userName;
  final String avatar;

  Host({
    required this.userId,
    required this.fullName,
    required this.userType,
    required this.instaLink,
    required this.fbLink,
    required this.xLink,
    this.birthdate,
    required this.gender,
    required this.userName,
    required this.avatar,
  });

  factory Host.fromMap(Map<String, dynamic> map) {
    return Host(
      userId: map['user_id'] as int,
      fullName: map['full_name'] ?? 'Unknown',
      userType: map['user_type'] ?? 'Unknown',
      instaLink: map['insta_link'] ?? '',
      fbLink: map['fb_link'] ?? '',
      xLink: map['x_link'] ?? '',
      birthdate: map['birthdate'] != null
          ? DateTime.parse(map['birthdate'])
          : null,
      gender: map['gender'] ?? 'Unknown',
      userName: map['user_name'] ?? 'Anonymous',
      avatar: map['avatar'] ??
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg', // Fallback for avatar
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'full_name': fullName,
      'user_type': userType,
      'insta_link': instaLink,
      'fb_link': fbLink,
      'x_link': xLink,
      'birthdate': birthdate?.toIso8601String(),
      'gender': gender,
      'user_name': userName,
      'avatar': avatar,
    };
  }
}