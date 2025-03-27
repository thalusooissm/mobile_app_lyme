import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/data/services/api/models/events_service.dart';
import 'package:lyme_app/domain/models/event_detail.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/home/widgets/home_trail_button.dart';
import 'package:lyme_app/ui/search/widgets/event_card_image.dart';

import 'package:lyme_app/ui/search/widgets/place_alt_card.dart';
import 'package:lyme_app/domain/models/place.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Place>> _placesFuture;
  late Future<List<EventDetail>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = fetchPlaces();
    _eventsFuture = _initializeEvents();
  }

  Future<List<Place>> fetchPlaces() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/repositories/places.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Place.fromMap(item)).toList();
  }

  // Future<List<EventDetail>> fetchEvents() async {
  //   final String response =
  //       await rootBundle.loadString('lib/assets/data/repositories/events.json');
  //   final List<dynamic> data = json.decode(response);
  //   return data.map((item) => EventDetail.fromMap(item)).toList();
  // }

  Future<List<EventDetail>> _initializeEvents() async {
    await EventsService.connect();
    final data = await EventsService.getData();
    if (data.isEmpty) {
      print('No events found in the database.');
      return [];
    }
    return data.map((map) => EventDetail.fromMap(map)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('Tìm Kiếm',
            style: FontTheme.customStyles['title3Emphasized']
                ?.copyWith(color: AppColors.labelPrimaryLight)),
        trailing: MainTrailButton(context: context),
      ),
      backgroundColor: AppColors.backgroundPrimary,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Dismiss keyboard when tapping outside
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoSearchTextField(
                  placeholder: 'Tìm kiếm',
                  autofocus: false,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  // cursorColor: AppColors.primary, // Uncomment if AppColors.primary is defined
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Địa điểm phổ biến',
                  style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                    color: AppColors.labelPrimaryLight,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<Place>>(
                future: _placesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No places available'));
                  } else {
                    final places = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0), // Moved padding inside
                      shrinkWrap: true, // Prevent infinite height issues
                      physics:
                          const NeverScrollableScrollPhysics(), // Avoid scroll conflict
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 3.0, // Adjusts grid item height
                      ),
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        return PlaceAltCard(place: places[index]);
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sự kiện nổi bật',
                  style: FontTheme.customStyles['title3Emphasized']?.copyWith(
                    color: AppColors.labelPrimaryLight,
                  ),
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder<List<EventDetail>>(
                future: _eventsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No events available'));
                  } else {
                    final events = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0), // Moved padding inside
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return EventCardImage(event: events[index]);
                      },
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
}

              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 20, // Number of items to simulate scrollable content
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text('Item $index'),
              //       );
              //     },
              //   ),
              // ),