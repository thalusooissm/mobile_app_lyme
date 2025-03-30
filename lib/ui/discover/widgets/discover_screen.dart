import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/data/services/api/models/places_service.dart';
import 'package:lyme_app/domain/models/topic.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/event_card.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/components/topic_ui.dart';
import 'package:lyme_app/ui/components/place_ui.dart';
import 'package:lyme_app/domain/models/place.dart';

import 'package:lyme_app/data/services/api/models/events_service.dart';
import 'package:lyme_app/data/services/api/models/topics_service.dart';
import 'package:lyme_app/data/services/api/models/places_service.dart';
import 'package:lyme_app/ui/home/widgets/home_trail_button.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<Place>> _placesFuture;
  late Future<List<EventDetail>> _eventsFuture, _eventsGridFuture;
  late Future<List<Topic>> _topicsFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = _initializePlaces();
    _eventsFuture = _initializeEvents();
    _topicsFuture = _initializeTopics();
    _eventsGridFuture = _eventsFuture;
  }

  // Future<List<Place>> fetchPlaces() async {
  //   final String response = await rootBundle.loadString('lib/assets/data/repositories/places.json');
  //   final List<dynamic> data = json.decode(response);
  //   return data.map((item) => Place.fromMap(item)).toList();
  // }

  Future<List<Place>> _initializePlaces() async {
    await PlacesService.connect();
    final data = await PlacesService.getData();
    if (data.isEmpty) {
      print('No places found in the database.');
      return [];
    }
    return data.map((map) => Place.fromMap(map)).toList();
  }

  Future<List<Topic>> _initializeTopics() async {
    await TopicsService.connect();
    final data = await TopicsService.getData();
    if (data.isEmpty) {
      print('No topics found in the database.');
      return [];
    }
    return data.map((map) => Topic.fromMap(map)).toList();
  }

  Future<List<EventDetail>> _initializeEvents() async {
    await EventsService.connect();
    final data = await EventsService.getData();
    if (data.isEmpty) {
      print('No events found in the database.');
      return [];
    }
    return data.map((map) => EventDetail.fromMap(map)).toList();
  }
  // Future<List<EventDetail>> fetchEvents() async {
  //   final String response = await rootBundle.loadString('lib/assets/data/repositories/events.json');
  //   final List<dynamic> data = json.decode(response);
  //   return data.map((item) => EventDetail.fromMap(item)).toList();
  // }

  List<EventDetail> dummyEvents = [
    EventDetail(
      eventId: 1,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 01 - Khởi Đầu",
      startTime: DateTime(2025, 11, 20, 16, 0),
      placeId: 101,
      hostIds: [201, 202, 203],
      topicId: 5,
      chainId: 2,
      about:
          "Sự kiện kết nối các chuyên gia công nghệ, nhà phát triển và nhà đổi mới để chia sẻ ý tưởng và khám phá xu hướng mới.",
      image:
          "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
      endTime: DateTime(2025, 11, 20, 21, 0),
      addressId: 301,
    ),
    EventDetail(
      eventId: 2,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 02 - Khám Phá",
      startTime: DateTime(2025, 11, 21, 16, 0),
      placeId: 102,
      hostIds: [204, 205, 206],
      topicId: 6,
      chainId: 3,
      about:
          "Phiên thảo luận về AI, blockchain và những công nghệ đột phá trong tương lai.",
      image:
          "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      endTime: DateTime(2025, 11, 21, 21, 0),
      addressId: 302,
    ),
    EventDetail(
      eventId: 3,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 03 - Kết Thúc",
      startTime: DateTime(2025, 11, 22, 16, 0),
      placeId: 103,
      hostIds: [207, 208, 209],
      topicId: 7,
      chainId: 4,
      about:
          "Sự kiện cuối cùng của chuỗi hội nghị, với các chuyên gia chia sẻ kinh nghiệm và cơ hội kết nối.",
      image:
          "https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg",
      endTime: DateTime(2025, 11, 22, 21, 0),
      addressId: 303,
    ),
    EventDetail(
      eventId: 4,
      eventName: "Hội Nghị Công Nghệ AI - Định Hình Tương Lai",
      startTime: DateTime(2025, 12, 5, 9, 0),
      placeId: 104,
      hostIds: [210, 211, 212],
      topicId: 8,
      chainId: 5,
      about:
          "Hội thảo chuyên sâu về AI, học máy và cách chúng đang thay đổi ngành công nghiệp.",
      image:
          "https://images.pexels.com/photos/3746234/pexels-photo-3746234.jpeg",
      endTime: DateTime(2025, 12, 5, 17, 0),
      addressId: 304,
    ),
    EventDetail(
      eventId: 5,
      eventName: "Hội Thảo Blockchain - Tương Lai Số",
      startTime: DateTime(2025, 12, 10, 14, 0),
      placeId: 105,
      hostIds: [213, 214, 215],
      topicId: 9,
      chainId: 6,
      about:
          "Hội thảo thảo luận về cách blockchain có thể ứng dụng vào các lĩnh vực kinh tế và tài chính.",
      image:
          "https://images.pexels.com/photos/11035569/pexels-photo-11035569.jpeg",
      endTime: DateTime(2025, 12, 10, 18, 0),
      addressId: 305,
    ),
    EventDetail(
      eventId: 6,
      eventName: "Diễn Đàn Công Nghệ Việt Nam 2025",
      startTime: DateTime(2026, 1, 15, 10, 0),
      placeId: 106,
      hostIds: [216, 217, 218],
      topicId: 10,
      chainId: 7,
      about:
          "Diễn đàn quy tụ các chuyên gia công nghệ hàng đầu Việt Nam, thảo luận về xu hướng và cơ hội phát triển.",
      image:
          "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
      endTime: DateTime(2026, 1, 15, 17, 0),
      addressId: 306,
    ),
  ];

  List<EventDetail> dummyEvents02 = [
    EventDetail(
      eventId: 2,
      eventName: "Hội Nghị Đổi Mới Công Nghệ 02 - Khám Phá",
      startTime: DateTime(2025, 11, 21, 16, 0),
      placeId: 102,
      hostIds: [204, 205, 206],
      topicId: 6,
      chainId: 3,
      about:
          "Phiên thảo luận về AI, blockchain và những công nghệ đột phá trong tương lai.",
      image:
          "https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg",
      endTime: DateTime(2025, 11, 21, 21, 0),
      addressId: 302,
    ),
    EventDetail(
      eventId: 4,
      eventName: "Hội Nghị Công Nghệ AI - Định Hình Tương Lai",
      startTime: DateTime(2025, 12, 5, 9, 0),
      placeId: 104,
      hostIds: [210, 211, 212],
      topicId: 8,
      chainId: 5,
      about:
          "Hội thảo chuyên sâu về AI, học máy và cách chúng đang thay đổi ngành công nghiệp.",
      image:
          "https://images.pexels.com/photos/3746234/pexels-photo-3746234.jpeg",
      endTime: DateTime(2025, 12, 5, 17, 0),
      addressId: 304,
    ),
    EventDetail(
      eventId: 6,
      eventName: "Diễn Đàn Công Nghệ Việt Nam 2025",
      startTime: DateTime(2026, 1, 15, 10, 0),
      placeId: 106,
      hostIds: [216, 217, 218],
      topicId: 10,
      chainId: 7,
      about:
          "Diễn đàn quy tụ các chuyên gia công nghệ hàng đầu Việt Nam, thảo luận về xu hướng và cơ hội phát triển.",
      image:
          "https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg",
      endTime: DateTime(2026, 1, 15, 17, 0),
      addressId: 306,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        leading: Row(
          children: [
            Text('Khám Phá',
                style: FontTheme.customStyles['title3Emphasized']
                    ?.copyWith(color: AppColors.labelPrimaryLight)),
            SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/vector.png'),
                  fit: BoxFit.fill,
                  scale: 1.5,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        trailing: MainTrailButton(context: context),
        backgroundColor: Colors.white.withAlpha((0.01 * 255).toInt()),
        enableBackgroundFilterBlur: true,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            _buildHeadingButton('Sự kiện nổi bật', '/list_of_events'),
            _buildEventGrid(),
            SizedBox(height: 16),
            _buildSectionHeader('Chủ đề'),
            SizedBox(height: 16),
            _buildTopicsFutureBuilder(),
            SizedBox(height: 32),
            _buildHeadingButton('Địa điểm', '/list_of_places'),
            SizedBox(height: 16),
            _buildPlacesFutureBuilder(),
            SizedBox(height: 32),
            _buildRecommendList(),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: FontTheme.customStyles['title3Emphasized']?.copyWith(
              color: AppColors.labelPrimaryLight,
            ),
          ),
          TextIconButton(
            text: 'Xem thêm',
            iconAssetPath: 'lib/assets/icons/arrow_forward_ios.svg',
            onPressed: () {
              print('View more button pressed');
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildHorizontalScrollView(List<Map<String, String>> items, Function(Map<String, String>) onTap) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16.0, right: 8.0),
  //           child: GestureDetector(
  //             onTap: () => onTap(items.first),
  //             child: TopicCard(
  //               iconAssetPath: items.first['icon']!,
  //               topicName: items.first['name']!,
  //             ),
  //           ),
  //         ),
  //         ...items.skip(1).take(9).map((item) {
  //           return Padding(
  //             padding: const EdgeInsets.only(right: 8.0),
  //             child: GestureDetector(
  //               onTap: () => onTap(item),
  //               child: TopicCard(
  //                 iconAssetPath: item['icon']!,
  //                 topicName: item['name']!,
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTopicsFutureBuilder() {
    return FutureBuilder<List<Topic>>(
      future: _topicsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('An error occurred: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No topics available'));
        } else {
          final topics = snapshot.data!;
          print("Topics loaded: ${topics.length}");
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: TopicCard(topic: topics.first),
                ),
                ...topics.skip(1).take(9).map((topic) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TopicCard(topic: topic),
                  );
                }).toList(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildPlacesFutureBuilder() {
    return FutureBuilder<List<Place>>(
      future: _placesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('An error occurred: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No places available'));
        } else {
          final places = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/place_screen');
                    },
                    child: PlaceCard(
                      place: places.first,
                    ),
                  ),
                ),
                ...places.skip(1).take(4).map((place) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/place_screen');
                      },
                      child: PlaceCard(
                        place: place,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        }
      },
    );
  }

  // Widget _buildEventGrid() {
  //   List<EventDetail> events = dummyEvents; // Load from dummyEvents
  //   int totalPages = (events.length / 2).ceil(); // 2 events per page

  //   return PageView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: totalPages,
  //     itemBuilder: (context, pageIndex) {
  //       int start = pageIndex * 2;
  //       int end = (start + 2).clamp(0, events.length);
  //       List<EventDetail> pageEvents = events.sublist(start, end);

  //       return Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 16),
  //         child: GridView.builder(
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2, // 2 columns per row
  //             mainAxisSpacing: 16,
  //             crossAxisSpacing: 16,
  //             childAspectRatio: 0.8, // Adjust for card size
  //           ),
  //           itemCount: pageEvents.length,
  //           physics: NeverScrollableScrollPhysics(), // Disable internal scroll
  //           itemBuilder: (context, index) {
  //             return EventCard(eventDetail: pageEvents[index]);
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildEventGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: dummyEvents02
            .map((event) => EventCard(eventDetail: event))
            .toList(),
      ),
    );
    // FutureBuilder<List<EventDetail>>(
    //   future: _eventsGridFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CupertinoActivityIndicator());
    //     }
    //     if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
    //       return Center(child: Text("No events found."));
    //     }

    //     List<EventDetail> events = snapshot.data!;
    //     int totalPages = (events.length / 2).ceil(); // 2 events per page

    //     return PageView.builder(
    //       scrollDirection: Axis.horizontal,
    //       itemCount: totalPages,
    //       itemBuilder: (context, pageIndex) {
    //         int start = pageIndex * 2;
    //         int end = (start + 2).clamp(0, events.length);
    //         List<EventDetail> pageEvents = events.sublist(start, end);

    //         return Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 16),
    //           child: GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2, // 2 rows per column
    //               mainAxisSpacing: 16,
    //               crossAxisSpacing: 16,
    //               childAspectRatio: 0.8, // Adjust for card size
    //             ),
    //             itemCount: pageEvents.length,
    //             physics:
    //                 NeverScrollableScrollPhysics(), // Disable internal scroll
    //             itemBuilder: (context, index) {
    //               return EventCard(eventDetail: pageEvents[index]);
    //             },
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
  }

  Widget _buildRecommendList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Lyme Dành Riêng Cho Bạn',
                style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                  color: AppColors.labelPrimaryLight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        // FutureBuilder<List<EventDetail>>(
        //   future: _eventsGridFuture,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CupertinoActivityIndicator());
        //     } else if (snapshot.hasError) {
        //       return Center(child: Text('Error: ${snapshot.error}'));
        //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //       return Center(child: Text('No events available.'));
        //     } else {
        //       final events = snapshot.data!;
        //       return Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //         child: ListView.builder(
        //           itemCount: events.length,
        //           itemBuilder: (context, index) {
        //             return EventCard(eventDetail: events[index]);
        //           },
        //         ),
        //       );
        //     }
        //   },
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: dummyEvents
                .map((event) => EventCard(eventDetail: event))
                .toList(),
          ),
        ),
      ],
    );
  }

  _buildHeadingButton(String label, String navigatorPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: FontTheme.customStyles['title3Emphasized']
                ?.copyWith(color: AppColors.labelPrimaryLight),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, navigatorPath);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Xem thêm',
                  style: FontTheme.customStyles['subheadlineRegular']
                      ?.copyWith(color: AppColors.gray),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 20, color: AppColors.gray),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
