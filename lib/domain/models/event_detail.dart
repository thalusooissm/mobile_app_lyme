class EventDetail {
  final int eventId;
  final String eventName;
  final DateTime startTime;
  final int placeId;
  final String host;
  final int organizerId;
  final int topicId;
  final int chainId;
  final String about;
  final String image;
  final DateTime endTime;
  final int addressId;

  const EventDetail({
    required this.eventId,
    required this.eventName,
    required this.startTime,
    required this.placeId,
    required this.host,
    required this.organizerId,
    required this.topicId,
    required this.chainId,
    required this.about,
    required this.image,
    required this.endTime,
    required this.addressId,
  });

  factory EventDetail.fromJson(Map<String, dynamic> json) {
    return EventDetail(
      eventId: json['event_id'] as int,
      eventName: json['event_name'] as String,
      startTime: DateTime.parse(json['start_time']),
      placeId: json['place_id'] as int,
      host: json['host'] as String,
      organizerId: json['organizer_id'] as int,
      topicId: json['topic_id'] as int,
      chainId: json['chain_id'] as int,
      about: json['about'] as String,
      image: json['image'] as String,
      endTime: DateTime.parse(json['end_time']),
      addressId: json['address_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'event_name': eventName,
      'start_time': startTime.toIso8601String(),
      'place_id': placeId,
      'host': host,
      'organizer_id': organizerId,
      'topic_id': topicId,
      'chain_id': chainId,
      'about': about,
      'image': image,
      'end_time': endTime.toIso8601String(),
      'address_id': addressId,
    };
  }
}