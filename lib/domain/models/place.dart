class Place {
  final int placeId; // Primary Key
  final String placeName;
  final String placeDescription;
  final String placeImage;

  Place({
    required this.placeId,
    required this.placeName,
    required this.placeDescription,
    required this.placeImage,
  });

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      placeId: map['place_id'],
      placeName: map['place_name'],
      placeDescription: map['place_des'],
      placeImage: map['place_image'],
    );
  }

  // Convert a Place instance into a map
  Map<String, dynamic> toMap() {
    return {
      'place_id': placeId,
      'place_name': placeName,
      'place_des': placeDescription,
      'place_image': placeImage,
    };
  }
}