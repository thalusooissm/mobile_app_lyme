class EventTicket {
  final int tickTypeId; 
  final int eventId;
  final int capacity;
  final String typeName;
  final String description;
  final bool ifFree;
  final double? price; 
  final double? discountPrice; 
  final bool ifDiscount;
  final int soldAmount;

  EventTicket({
    required this.tickTypeId,
    required this.eventId,
    required this.capacity,
    required this.typeName,
    required this.description,
    required this.ifFree,
    this.price,
    this.discountPrice,
    required this.ifDiscount,
    required this.soldAmount,
  });

  factory EventTicket.fromMap(Map<String, dynamic> map) {
    return EventTicket(
      tickTypeId: map['tick_type_id'] as int,
      eventId: map['event_id'] as int,
      capacity: map['capacity'] as int,
      typeName: map['type_name'] ?? 'Unknown',
      description: map['description'] ?? '',
      ifFree: map['if_free'] == 1,
      price: map['price'] != null ? (map['price'] as num).toDouble() : null,
      discountPrice: map['discount_price'] != null
          ? (map['discount_price'] as num).toDouble()
          : null,
      ifDiscount: map['if_discount'] == 1,
      soldAmount: map['sold_amount'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tick_type_id': tickTypeId,
      'event_id': eventId,
      'capacity': capacity,
      'type_name': typeName,
      'description': description,
      'if_free': ifFree ? 1 : 0,
      'price': price,
      'discount_price': discountPrice,
      'if_discount': ifDiscount ? 1 : 0,
      'sold_amount': soldAmount,
    };
  }
}