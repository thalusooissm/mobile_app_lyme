class Ticket {
  final int ticketId; // Primary Key
  final int eventId;
  final int userId;
  final DateTime dateCreated;
  final String state;
  final DateTime? dateUsed;
  final String transDetailId;
  final String area;
  final String row;
  final String seat;
  final String identityCode;
  final String referenceCode;

  Ticket({
    required this.ticketId,
    required this.eventId,
    required this.userId,
    required this.dateCreated,
    required this.state,
    this.dateUsed,
    required this.transDetailId,
    required this.area,
    String? row, // Optional with default value
    String? seat, // Optional with default value
    required this.identityCode, // Optional with default value
    required this.referenceCode, // Optional with default value
  })  : row = row ?? '',
        seat = seat ?? '';

  Map<String, dynamic> toMap() {
    return {
      'ticket_id': ticketId,
      'event_id': eventId,
      'user_id': userId,
      'date_created': dateCreated.toIso8601String(),
      'state': state,
      'date_used': dateUsed?.toIso8601String(),
      'trans_detail_id': transDetailId,
      'area': area,
      'row': row,
      'seat': seat,
      'identity_code': identityCode,
      'reference_code': referenceCode,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> json) {
    return Ticket(
      ticketId: json['ticket_id'],
      eventId: json['event_id'],
      userId: json['user_id'],
      dateCreated: DateTime.parse(json['date_created']),
      state: json['state'],
      dateUsed: json['date_used'] != null ? DateTime.parse(json['date_used']) : null,
      transDetailId: json['trans_detail_id'],
      area: json['area'],
      row: json['row'] ?? '',
      seat: json['seat'] ?? '',
      identityCode: json['identity_code'] ?? '',
      referenceCode: json['reference_code'] ?? '',
    );
  }
}