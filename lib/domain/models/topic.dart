import 'package:mongo_dart/mongo_dart.dart';

class Topic {
  final int topicId; // Custom Primary Key
  final String topicName;
  final String? description; // Optional description
  final String image;

  Topic({
    required this.topicId,
    required this.topicName,
    this.description, // Optional description
    required this.image,
  });

  // Factory method to create a Topic instance from MongoDB document
  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      topicId: map['topic_id'] as int,
      topicName: map['name'] as String,
      description: map['description'] as String?, // Optional description
      image: map['icon'] as String,
    );
  }

  // Convert a Topic instance into a MongoDB document (map)
  Map<String, dynamic> toMap() {
    return {
      'topic_id': topicId,
      'name': topicName,
      'description': description,
      'icon': image,
    };
  }
}