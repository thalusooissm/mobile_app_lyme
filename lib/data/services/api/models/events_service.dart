import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:mongo_dart/mongo_dart.dart';

class EventsService {
  static Db? db;
  static DbCollection? eventCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://mobile_app:CQDToVTJKlQYEDNz@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
      await db!.open();
      print('Connected to MongoDB');

      final collections = await db!.getCollectionNames();
      print('Available collections: $collections');

      const targetCollection = "events";
      if (collections.contains(targetCollection)) {
        eventCollection = db!.collection(targetCollection);
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
      final arrData = await eventCollection!.find().toList();
      if (arrData.isEmpty) {
        print('The collection is empty.');
      } else {
        print('Data in collection: ${arrData.toString()}');
      }
      return arrData;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  static Future<Map<String, dynamic>?> getEventById(String eventId) async {
    try {
      final ObjectId objectId = ObjectId.parse(eventId);
      final event = await eventCollection!.findOne(where.id(objectId));

      if (event != null) {
        print('Event found: $event');
      } else {
        print('No event found with ID: $eventId');
      }
      return event;
    } catch (e) {
      print('Error fetching event by ID: $e');
      return null;
    }
  }
}