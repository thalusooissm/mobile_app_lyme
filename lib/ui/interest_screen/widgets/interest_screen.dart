import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/components/event_card.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/home/widgets/home_trail_button.dart';

import 'package:lyme_app/ui/interest_screen/widgets/follow_object.dart';

class InterestScreen extends StatefulWidget {
  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final dummyEvent01 = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup",
    startTime: DateTime.parse("2025-04-15 18:00:00"),
    placeId: 101,
    hostIds: [1, 2, 3],
    topicId: 5,
    chainId: 2,
    about: "Tham gia ngay.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime.parse("2025-04-15 21:00:00"),
    addressId: 202,
  );

  final List<Map<String, String>> followedObjects = [
    {
      'text': 'Chuỗi Triển lãm những địa hạt phù du',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
    {
      'text': 'Chuỗi Triển lãm những địa hạt phù du',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
    {
      'text': 'Tổ chức Amoda',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
    {
      'text': 'TP. Hồ Chí Minh',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
    {
      'text': 'Tổ chức Amoda',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
    {
      'text': 'Đà Nẵng',
      'imageUrl':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: AppColors.backgroundPrimary,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.backgroundPrimary,
          automaticBackgroundVisibility: true,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quan Tâm',
                style: FontTheme.customStyles['title3Emphasized']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
              ),
              SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/vector.png'),
                    fit: BoxFit.fill,
                    scale: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
          trailing: MainTrailButton(context: context),
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Sự kiện yêu thích'),
            SizedBox(height: 16),
            _buildListofFavoritEvent(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Đang theo dõi',
                style: FontTheme.customStyles['title3Emphasized']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: followedObjects.length,
                itemBuilder: (context, index) {
                  return FollowedObject(
                    text: followedObjects[index]['text']!,
                    imageUrl: followedObjects[index]['imageUrl']!,
                  );
                },
              ),
            ),
          ],
        )));
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

  Widget _buildListofFavoritEvent() {
    return Column(
      children: [
        EventCard(eventDetail: dummyEvent01),
        EventCard(eventDetail: dummyEvent01),
        EventCard(eventDetail: dummyEvent01),
      ],
    );
  }
}
