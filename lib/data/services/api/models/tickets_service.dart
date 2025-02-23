import 'package:mongo_dart/mongo_dart.dart';

class TicketsService {
  static Db? db;
  static DbCollection? ticketCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(
          "mongodb+srv://mobile_app:CQDToVTJKlQYEDNz@cluster1.gm0fb.mongodb.net/lyme_app?retryWrites=true&w=majority&appName=Cluster1");
      await db!.open();
      print('Connected to MongoDB');

      final collections = await db!.getCollectionNames();
      print('Available collections: $collections');

      const targetCollection = "tickets"; // Changed to "tickets"
      if (collections.contains(targetCollection)) {
        ticketCollection = db!.collection(targetCollection);
        print('Collection "$targetCollection" found and assigned.');
      } else {
        print('Collection "$targetCollection" does not exist in the database.');
      }
    } catch (e) {
      print('Error connecting to MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getAllTickets() async {
    try {
      if (ticketCollection == null) {
        print('Error: Ticket collection is not initialized.');
        return [];
      }

      final tickets = await ticketCollection!.find().toList();
      if (tickets.isEmpty) {
        print('No tickets found.');
      } else {
        print('Fetched tickets: ${tickets.toString()}');
      }
      return tickets;
    } catch (e) {
      print('Error fetching tickets: $e');
      return [];
    }
  }

  static Future<Map<String, dynamic>?> getTicketById(String ticketId) async {
    try {
      if (ticketCollection == null) {
        print('Error: Ticket collection is not initialized.');
        return null;
      }

      final ObjectId objectId = ObjectId.parse(ticketId);
      final ticket = await ticketCollection!.findOne(where.id(objectId));

      if (ticket != null) {
        print('Ticket found: $ticket');
      } else {
        print('No ticket found with ID: $ticketId');
      }
      return ticket;
    } catch (e) {
      print('Error fetching ticket by ID: $e');
      return null;
    }
  }

}