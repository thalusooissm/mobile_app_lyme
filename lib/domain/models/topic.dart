import 'package:mongo_dart/mongo_dart.dart';

class Topic {
  final ObjectId id; // MongoDB ObjectId
  final int topicId; // Custom Primary Key
  final String topicName;
  final String? description; // Optional description
  final String image;

  Topic({
    required this.id,
    required this.topicId,
    required this.topicName,
    this.description, // Optional description
    required this.image,
  });

  // Factory method to create a Topic instance from MongoDB document
  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['_id'] as ObjectId, // MongoDB ObjectId
      topicId: map['topic_id'] as int,
      topicName: map['topic_name'] as String,
      description: map['description'] as String?, // Optional description
      image: map['image'] as String,
    );
  }

  // Convert a Topic instance into a MongoDB document (map)
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'topic_id': topicId,
      'topic_name': topicName,
      'description': description,
      'image': image,
    };
  }
}