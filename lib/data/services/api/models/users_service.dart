import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UsersService {
  static Db? db;
  static DbCollection? usersCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://mobile_app:CQDToVTJKlQYEDNz@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
      await db!.open();
      print('Connected to MongoDB');

      final collections = await db!.getCollectionNames();

      const targetCollection = "users";
      if (collections.contains(targetCollection)) {
        usersCollection = db!.collection(targetCollection);
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
      final arrData = await usersCollection!.find().toList();
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

  static Future<Map<String, dynamic>?> getUserById(int userId) async {
    try {
      if (usersCollection == null) {
        print('Error: usersCollection is not initialized.');
        return null;
      }

      final user = await usersCollection!.findOne(where.eq('user_id', userId));

      if (user != null) {
        print('User found: $user');
      } else {
        print('No user found with ID: $userId');
      }
      return user;
    } catch (e) {
      print('Error fetching user by ID: $e');
      return null;
    }
  } 
static Future<List<Map<String, dynamic>>> getUsersByIds(List<int> userIds) async {
  try {
    if (usersCollection == null) {
      print('Error: usersCollection is not initialized.');
      return [];
    }

    final users = await usersCollection!.find(
      where.oneFrom('user_id', userIds), // Directly use `userIds` without re-parsing
    ).toList();

    if (users.isNotEmpty) {
      print('Users found: $users');
    } else {
      print('No users found for given IDs.');
    }

    return users;
  } catch (e) {
    print('Error fetching users by IDs: $e');
    return [];
  }
}
}