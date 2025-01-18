class Topic {
  final int topicId; // Primary Key
  final String topicName;
  final String description;
  final String image;

  Topic({
    required this.topicId,
    required this.topicName,
    required this.description,
    required this.image,
  });

  // Factory method for creating a Topic instance from a map (e.g., from a database or JSON)
  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      topicId: map['topic_id'],
      topicName: map['topic_name'],
      description: map['description'],
      image: map['image'],
    );
  }

  // Convert a Topic instance into a map
  Map<String, dynamic> toMap() {
    return {
      'topic_id': topicId,
      'topic_name': topicName,
      'description': description,
      'image': image,
    };
  }
}