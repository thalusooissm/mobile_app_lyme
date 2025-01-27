import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/event_card.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/components/topic_ui.dart';
import 'package:lyme_app/ui/components/place_ui.dart';
import 'package:lyme_app/domain/models/place.dart';

import 'package:lyme_app/data/services/api/models/events_service.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<Place>> _placesFuture;
  late Future<List<EventDetail>> _eventsFuture;

  final List<Map<String, String>> topics = [
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 1'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 2'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 3'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 4'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 5'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 6'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 7'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 8'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 9'},
    {'icon': 'lib/assets/topic_icon/palette.svg', 'name': 'Topic 10'},
  ];

  @override
  void initState() {
    super.initState();
    _placesFuture = fetchPlaces();
     _eventsFuture = _initializeEvents();

    // EventsService.connect().then((_) {
    //   EventsService.getData().then((data) {
    //     setState(() {
    //       _eventsFuture = Future.value(data.map((map) => EventDetail.fromMap(map)).toList());
    //     });
    //   });
    // }).catchError((e) {
    //   print('Error connecting to MongoDB: $e');
    // });
  }

  Future<List<Place>> fetchPlaces() async {
    final String response = await rootBundle.loadString('lib/assets/data/repositories/places.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Place.fromMap(item)).toList();
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          children: [
            Text('Khám Phá', style: FontTheme.customStyles['title3Emphasized']?.copyWith(color: AppColors.labelPrimaryLight)),
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
            ),          ],
        ),
        backgroundColor: Colors.white.withAlpha((0.01 * 255).toInt()),
        enableBackgroundFilterBlur: true,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56), // Add padding to avoid overlap with navigation bar
              _buildSectionHeader('Sự kiện nổi bật'),
              _buildSectionHeader('Chủ đề'),
              SizedBox(height: 16),
              _buildHorizontalScrollView(topics, (topic) {
                print('${topic['name']} pressed');
              }),
              SizedBox(height: 32),
              _buildSectionHeader('Địa điểm'),
              SizedBox(height: 16),
              _buildPlacesFutureBuilder(),
              SizedBox(height: 32),
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
              FutureBuilder<List<EventDetail>>(
                future: _eventsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No events available.'));
                  } else {
                    final events = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: events
                            .map((event) => EventCard(eventDetail: event))
                            .toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
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

  Widget _buildHorizontalScrollView(List<Map<String, String>> items, Function(Map<String, String>) onTap) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: GestureDetector(
              onTap: () => onTap(items.first),
              child: TopicCard(
                iconAssetPath: items.first['icon']!,
                topicName: items.first['name']!,
              ),
            ),
          ),
          ...items.skip(1).take(9).map((item) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => onTap(item),
                child: TopicCard(
                  iconAssetPath: item['icon']!,
                  topicName: item['name']!,
                ),
              ),
            );
          }).toList(),
        ],
      ),
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
                      print('First place pressed: ${places.first.placeName}');
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
                        print('${place.placeName} pressed');
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
}
