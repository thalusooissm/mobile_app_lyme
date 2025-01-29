import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  Future<List<Host>> _initializeHosts() async {
  await UsersService.connect();
  final List<Map<String, dynamic>> data = await UsersService.getUsersByIds(
    widget.eventDetail.hostIds.map((e) => e.toString()).toList(),
  );
  if (data.isEmpty) {
    print('No events found in the database.');
    return [];
  }
  return data.map((map) => Host.fromMap(map)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/event_detail');
        print('Event card tapped');
      },
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
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
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
                        FutureBuilder<List<Host>>(
                          future: _hostsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text('No hosts found.'));
                            } else {
                              final hosts = snapshot.data!;
                              return SizedBox(
                                height: 24,
                                width: hosts.length * 22.0,
                                child: Stack(
                                  children: hosts.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final host = entry.value;
                                    return Positioned(
                                      left: index * 14.0,
                                      child: HostAvatarWidget(hostAvatar: host.avatar),
                                    );
                                  }).toList(),
                                ),
                              );
                            }
                          },
                        ),
                        // Host Name
                        FutureBuilder<List<Host>>(
                          future: _hostsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text('No hosts found.'));
                            } else {
                              final hosts = snapshot.data!;
                              final hostNames = hosts.map((host) => host.fullName).join(', ');
                              return Text(
                                hostNames,
                                style: FontTheme.customStyles['caption1Regular']?.copyWith(
                                  color: AppColors.labelSecondaryLight,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Event Name
                    Text(
                      widget.eventDetail.eventName,
                      style: FontTheme.customStyles['subheadlineRegular']?.copyWith(
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
                              '${widget.eventDetail.startTime}',
                              style: FontTheme.customStyles['caption1Regular']?.copyWith(
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
                              'abc',
                              style: FontTheme.customStyles['caption1Regular']?.copyWith(
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
  final String hostAvatar;

  const HostAvatarWidget({Key? key, required this.hostAvatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(hostAvatar),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
