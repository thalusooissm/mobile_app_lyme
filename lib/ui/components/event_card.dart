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

  const EventCard({
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

  Future<List<Host>> _initializeHosts() async {
    try {
      await UsersService.connect();
      final List<Map<String, dynamic>> data =
          await UsersService.getUsersByIds(widget.eventDetail.hostIds);

      return data.isEmpty ? [] : data.map((map) => Host.fromMap(map)).toList();
    } catch (e) {
      print('Error initializing hosts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/event_detail');
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
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
                  border: Border.all(
                      width: 0.33, color: AppColors.nonOpaqueSeparator),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<List<Host>>(
                      future: _hostsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                            height: 40,
                            child: Center(child: CupertinoActivityIndicator()),
                          );
                        }
                        if (snapshot.hasError || !snapshot.hasData) {
                          return const Text(
                            'No hosts found.',
                            style: TextStyle(color: Colors.red),
                          );
                        }

                        final hosts = snapshot.data!;
                        return Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: hosts.length * 30.0,
                              child: Stack(
                                children: hosts.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final host = entry.value;
                                  return Positioned(
                                    left: index * 18.0,
                                    child: HostAvatarWidget(host: host),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                hosts.map((host) => host.fullName).join(', '),
                                style: FontTheme.customStyles['caption1Regular']
                                    ?.copyWith(
                                  color: AppColors.labelSecondaryLight,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 6),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.watch_later_rounded,
                              color: AppColors.fillTertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.eventDetail.startTime as String,
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
                            const Icon(
                              Icons.explore_rounded,
                              color: AppColors.fillTertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'abc',
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
  final Host host;

  const HostAvatarWidget({Key? key, required this.host}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage.assetNetwork(
          placeholder:
              'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
          image: host.avatar,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) => Image.network(
              'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
