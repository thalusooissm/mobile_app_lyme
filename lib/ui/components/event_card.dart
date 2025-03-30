import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/domain/models/host.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/data/services/api/models/users_service.dart';

class EventCard extends StatefulWidget {
  final EventDetail eventDetail;
  late Future<List<Host>> _hostsFuture;

  EventCard({
    Key? key,
    required this.eventDetail,
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late Future<List<Host>> _hostsFuture;

  List<String> dummyHostNames = [
    "Lực Nguyễn",
    "Minh Thi",
    "Thiện Brown",
  ];

  List<String> dummyHostImages = [
    "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
  ];

  @override
  void initState() {
    super.initState();

    _hostsFuture = _initializeHosts();
  }

  // Future<List<Host>> fetchHosts(List<int> hostIds) async {
  //   try {
  //     final String response = await rootBundle.loadString('lib/assets/data/repositories/users.json');
  //     final List<dynamic> data = jsonDecode(response);
  //     List<Host> allHosts = data.map((hostMap) => Host.fromMap(hostMap)).toList();
  //     return allHosts.where((host) => hostIds.contains(host.userId)).toList();
  //   } catch (e) {
  //     print("Error fetching hosts: $e");
  //     return [];
  //   }
  // }

// ✅ Improved version of `_initializeHosts()`
  Future<List<Host>> _initializeHosts() async {
    try {
      await UsersService.connect();

      final List<Map<String, dynamic>> data = await UsersService.getUsersByIds(
        widget.eventDetail
            .hostIds, // No need for `.map((e) => e.toString()).toList()`
      );

      if (data.isEmpty) {
        print('No hosts found in the database.');
        return [];
      }

      return data.map((map) => Host.fromMap(map)).toList();
    } catch (e) {
      print('Error initializing hosts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // String formattedDateTime = DateFormat('HH:mm, dd/MM/yyyy').format(widget.eventDetail.startTime);
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/event_detail');
      },
      padding: EdgeInsets.symmetric(horizontal: 16),
      borderRadius: BorderRadius.circular(0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.eventDetail.image),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                      width: 0.33, color: AppColors.nonOpaqueSeparator),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Host Avatar
                        SizedBox(
                          height: 24,
                          width: (dummyHostImages.length * 24) +
                              ((dummyHostImages.length - 1) * -6),
                          child: Stack(
                            children:
                                dummyHostImages.asMap().entries.map((entry) {
                              final index = entry.key;
                              final imageUrl = entry.value;
                              return Positioned(
                                left: index *
                                    18.0, // Adjust overlap (24px width - 6px overlap)
                                child: HostAvatarWidget(host: imageUrl),
                              );
                            }).toList(),
                          ),
                        ),
                        Text(
                          dummyHostNames.join(', '),
                          style: FontTheme.customStyles['caption1Regular']
                              ?.copyWith(
                            color: AppColors.labelSecondaryLight,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Event Name
                    Text(
                      widget.eventDetail.eventName,
                      style: FontTheme.customStyles['subheadlineRegular']
                          ?.copyWith(
                        color: AppColors.labelPrimaryLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Footer Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_rounded,
                              color: AppColors.fillTertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              DateFormat('HH:mm, dd/MM/yyyy')
                                  .format(widget.eventDetail.startTime),
                              style: FontTheme.customStyles['caption1Regular']
                                  ?.copyWith(
                                color: AppColors.labelSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.explore_rounded,
                              color: AppColors.fillTertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'TP. Hồ Chí Minh',
                              style: FontTheme.customStyles['caption1Regular']
                                  ?.copyWith(
                                color: AppColors.labelSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HostAvatarWidget extends StatelessWidget {
  final String host;

  const HostAvatarWidget({Key? key, required this.host}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(
            host,
          ),
          fit: BoxFit.fill,
          onError: (error, stackTrace) {
            debugPrint("Image Load Error: $error");
          },
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
