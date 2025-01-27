import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:mongo_dart/mongo_dart.dart';

class EventsService {
  static Db? db;
  static DbCollection? eventCollection;

static Future<void> connect() async {
  try {
    db = await Db.create(
        "mongodb+srv://lucnt21411:zM5NNFkYgNIOcUSU@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
    await db!.open();
    print('Connected to MongoDB');

    // List all collection names in the database
    final collections = await db!.getCollectionNames();
    print('Available collections: $collections');

    // Verify if the target collection exists
    const targetCollection = "events"; // Your collection name
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
}