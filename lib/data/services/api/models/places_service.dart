import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:mongo_dart/mongo_dart.dart';

class PlacesService {
  static Db? db;
  static DbCollection? placeCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://mobile_app:CQDToVTJKlQYEDNz@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
      await db!.open();
      print('Connected to MongoDB');

      final collections = await db!.getCollectionNames();
      print('Available collections: $collections');

      const targetCollection = "places";
      if (collections.contains(targetCollection)) {
        placeCollection = db!.collection(targetCollection);
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
      final arrData = await placeCollection!.find().toList();
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

  static Future<Map<String, dynamic>?> getPlaceById(String placeId) async {
    try {
      if (placeCollection == null) {
        print('Error: usersCollection is not initialized.');
        return null;
      }

      final place = await placeCollection!.findOne(where.eq('place_id', placeId));

      if (place != null) {
        print('Place found: $place');
      } else {
        print('No place found with ID: $placeId');
      }
      return place;
    } catch (e) {
      print('Error fetching place by ID: $e');
      return null;
    }
  }
}