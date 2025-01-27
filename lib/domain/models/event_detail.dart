class EventDetail {
  final int eventId;
  final String eventName;
  final DateTime startTime;
  final int placeId;
  final List<int> hostIds; 
  final int topicId;
  final int chainId;
  final String about;
  final String image;
  final DateTime endTime;
  final int addressId;

  EventDetail({
    required this.eventId,
    required this.eventName,
    required this.startTime,
    required this.placeId,
    required this.hostIds, 
    required this.topicId,
    required this.chainId,
    required this.about,
    required this.image,
    required this.endTime,
    required this.addressId,
  });

  factory EventDetail.fromMap(Map<String, dynamic> map) {
    try {
      return EventDetail(
        eventId: map['_id'] ?? 0,
        eventName: map['event_name'] ?? 'Untitled Event',
        startTime: map['start_time'] != null
            ? DateTime.parse(map['start_time'])
            : DateTime.now(),
        placeId: map['place_id'] ?? 0,
        hostIds: List<int>.from(map['host_ids'] ?? []),
        topicId: map['topic_id'] ?? 0,
        chainId: map['chain_id'] ?? 0,
        about: map['about'] ?? 'No details provided.',
        image: map['image'] ?? '',
        endTime: map['end_time'] != null
            ? DateTime.parse(map['end_time'])
            : DateTime.now().add(Duration(hours: 2)),
        addressId: map['address_id'] ?? 0,
      );
    } catch (e) {
      print('Error decoding EventDetail: $e');
      rethrow; // Optional: Throw the error if you want to halt execution.
    }
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': eventId,
      'event_name': eventName,
      'start_time': startTime.toIso8601String(),
      'place_id': placeId,
      'host_ids': hostIds, 
      'topic_id': topicId,
      'chain_id': chainId,
      'about': about,
      'image': image,
      'end_time': endTime.toIso8601String(),
      'address_id': addressId,
    };
  }
}