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

  factory Blast.fromMap(Map<String, dynamic> map) {
    return Blast(
      blastId: map['blast_id'] as int,
      eventId: map['event_id'] as int,
      hostId: map['host_id'] as int,
      timestamp: map['timestamp'] != null && map['timestamp'] is String
          ? DateTime.tryParse(map['timestamp']) ?? DateTime.now()
          : DateTime.now(), // Fallback to current time
      content: map['content']?.toString() ?? '', // Ensure it's a string
    );
  }

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
