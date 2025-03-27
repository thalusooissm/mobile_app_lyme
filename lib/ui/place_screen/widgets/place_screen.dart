import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/components/event_card.dart';
import 'package:lyme_app/ui/core/themes/colors.dart'; // Ensure AppColors is imported
import 'package:lyme_app/ui/core/themes/theme.dart'; // Ensure FontTheme is imported

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  _PlaceScreenState createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  bool isFollowing = false; // Track button state

  EventDetail eventDetail = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup 01 - Overture",
    startTime: DateTime(2025, 11, 20, 16, 0),
    placeId: 101,
    hostIds: [201, 202, 203],
    topicId: 5,
    chainId: 2,
    about:
        "A networking event for tech enthusiasts, developers, and innovators to share ideas and explore new trends in technology.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime(2025, 11, 20, 21, 0), // April 10, 2025, 9:00 PM
    addressId: 301,
  );
  EventDetail eventDetail2 = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup 02 - Discovery",
    startTime: DateTime(2025, 11, 21, 16, 0),
    placeId: 101,
    hostIds: [201, 202, 203],
    topicId: 5,
    chainId: 2,
    about:
        "A networking event for tech enthusiasts, developers, and innovators to share ideas and explore new trends in technology.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime(2025, 11, 21, 21, 0), // April 10, 2025, 9:00 PM
    addressId: 301,
  );

  EventDetail eventDetail3 = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup 03 - Final",
    startTime: DateTime(2025, 11, 22, 16, 0),
    placeId: 101,
    hostIds: [201, 202, 203],
    topicId: 5,
    chainId: 2,
    about:
        "A networking event for tech enthusiasts, developers, and innovators to share ideas and explore new trends in technology.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime(2025, 11, 22, 21, 0), // April 10, 2025, 9:00 PM
    addressId: 301,
  );
  EventDetail eventDetail4 = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup Ending After - Final",
    startTime: DateTime(2025, 11, 22, 16, 0),
    placeId: 101,
    hostIds: [201, 202, 203],
    topicId: 5,
    chainId: 2,
    about:
        "A networking event for tech enthusiasts, developers, and innovators to share ideas and explore new trends in technology.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime(2025, 11, 22, 21, 0), // April 10, 2025, 9:00 PM
    addressId: 301,
  );
  EventDetail eventDetail5 = EventDetail(
    eventId: 1,
    eventName: "Tech Innovators Meetup Ending After - Final",
    startTime: DateTime(2025, 11, 22, 16, 0),
    placeId: 101,
    hostIds: [201, 202, 203],
    topicId: 5,
    chainId: 2,
    about:
        "A networking event for tech enthusiasts, developers, and innovators to share ideas and explore new trends in technology.",
    image: "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg",
    endTime: DateTime(2025, 11, 22, 21, 0), // April 10, 2025, 9:00 PM
    addressId: 301,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16), // ✅ Wraps everything with horizontal padding
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns text to the left
                children: [
                  Text(
                    'Các Sự Kiện Tại',
                    style: FontTheme.customStyles['caption1Regular']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'TP. Hồ Chí Minh',
                    style: FontTheme.customStyles['title1Emphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        // ✅ Prevents overflow for long text
                        child: Text(
                          'TP Hồ Chí Minh là trung tâm văn hóa, kinh tế và du lịch của Việt Nam, nơi diễn ra nhiều sự kiện quan trọng. Hàng năm, thành phố tổ chức các lễ hội, hội nghị quốc tế và các sự kiện văn hóa đa dạng như Lễ hội Áo dài, Tuần lễ thời trang, và các triển lãm quốc tế. Ngoài ra, các hoạt động thể thao và âm nhạc cũng thu hút đông đảo người dân và du khách. Thành phố luôn là điểm đến hấp dẫn với nhiều sự kiện sôi động và phong phú.',
                          style: FontTheme.customStyles['caption1Regular']
                              ?.copyWith(color: AppColors.labelSecondaryLight),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: isFollowing
                            ? Colors.white
                            : AppColors.primaryAsSurface,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border:
                            Border.all(color: AppColors.primary, width: 0.33),
                      ),
                      child: Center(
                        child: Text(
                          isFollowing ? 'Đang theo dõi' : 'Theo dõi',
                          style: FontTheme.customStyles['subheadlineRegular']
                              ?.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Ngày 20 Tháng 11',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  Text(
                    ' / Thứ 4',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            EventCard(eventDetail: eventDetail),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Ngày 21 Tháng 11',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  Text(
                    ' / Thứ 5',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            EventCard(eventDetail: eventDetail2),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Ngày 22 Tháng 11',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  Text(
                    ' / Thứ 6',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            EventCard(eventDetail: eventDetail3),
            EventCard(eventDetail: eventDetail4),
            EventCard(eventDetail: eventDetail5),
            SizedBox(
              height: 120,
            ),
          ], //
        ),
      ),
    );
  }
}
