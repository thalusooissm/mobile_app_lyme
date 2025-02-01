import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:mongo_dart/mongo_dart.dart';

class TopicsService {
  static Db? db;
  static DbCollection? topicCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://mobile_app:CQDToVTJKlQYEDNz@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
      await db!.open();
      print('Connected to MongoDB');

      final collections = await db!.getCollectionNames();
      print('Available collections: $collections');

      const targetCollection = "topics";
      if (collections.contains(targetCollection)) {
        topicCollection = db!.collection(targetCollection);
        print('Collection "$targetCollection" found and assigned.');
      } else {
        print('Collection "$targetCollection" does not exist in the database.');
      }
    } catch (e) {
      print('Error connecting to MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    try {
      final arrData = await topicCollection!.find().toList();
      if (arrData.isEmpty) {
        print('The collection is empty.');
      } else {
        print('Data in collection: A');
      }
      return arrData;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  static Future<Map<String, dynamic>?> getTopicById(String topicId) async {
    try {
      if (topicCollection == null) {
        print('Error: topicCollection is not initialized.');
        return null;
      }

      final topic = await topicCollection!.findOne(where.eq('topic_id', topicId));

      if (topic != null) {
        print('Topic found: $topicId');
      } else {
        print('No topic found with ID: $topicId');
      }
      return topic;
    } catch (e) {
      print('Error fetching topic by ID: $e');
      return null;
    }
  }
}