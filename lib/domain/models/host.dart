class Host {
  final int userId; // Primary Key
  final String fullName;
  final String userType;
  final String? instaLink; // Nullable
  final String? fbLink; // Nullable
  final String? xLink; // Nullable
  final DateTime? birthdate; // Nullable
  final String gender;
  final String userName;
  final String avatar;
  final String hostType; // Required
  final String? bio; // Nullable

  Host({
    required this.userId,
    required this.fullName,
    required this.userType,
    this.instaLink,
    this.fbLink,
    this.xLink,
    this.birthdate,
    required this.gender,
    required this.userName,
    required this.avatar,
    required this.hostType, // Now required
    this.bio,
  });

  factory Host.fromMap(Map<String, dynamic> map) {
    if (map['host_type'] == null) {
      throw ArgumentError('host_type is required but not found in the map');
    }

    return Host(
      userId: map['user_id'] as int,
      fullName: map['full_name'] ?? 'Unknown',
      userType: map['user_type'] ?? 'Unknown',
      instaLink: map['insta_link'] as String?,
      fbLink: map['fb_link'] as String?,
      xLink: map['x_link'] as String?,
      birthdate: map['birthdate'] != null
          ? DateTime.parse(map['birthdate'])
          : null,
      gender: map['gender'] ?? 'Unknown',
      userName: map['user_name'] ?? 'Anonymous',
      avatar: map['avatar'] ?? '',
      hostType: map['host_type'] as String, // Required
      bio: map['bio'] as String?,
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
      'host_type': hostType, // Required field included
      'bio': bio,
    };
  }
}