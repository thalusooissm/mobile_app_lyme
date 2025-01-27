class Blast {
  final int blastId; // Primary Key
  final int eventId;
  final int hostId;
  final DateTime timestamp;
  final String content;

  Blast({
    required this.blastId,
    required this.eventId,
    required this.hostId,
    required this.timestamp,
    required this.content,
  });

  // Factory constructor to create a Blast object from a map
  factory Blast.fromMap(Map<String, dynamic> map) {
    return Blast(
      blastId: map['blast_id'] as int,
      eventId: map['event_id'] as int,
      hostId: map['host_id'] as int,
      timestamp: DateTime.parse(map['timestamp']),
      content: map['content'] ?? '',
    );
  }

  // Convert a Blast object to a map
  Map<String, dynamic> toMap() {
    return {
      'blast_id': blastId,
      'event_id': eventId,
      'host_id': hostId,
      'timestamp': timestamp.toIso8601String(),
      'content': content,
    };
  }
}