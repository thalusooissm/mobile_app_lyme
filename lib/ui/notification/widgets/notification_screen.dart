import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/my_ticket/widgets/label_filter.dart';
import 'package:lyme_app/ui/notification/widgets/notification_card.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> filterOptions = [
    {'label': 'Tất cả', 'isSelected': true},
    {'label': 'Chưa đọc', 'isSelected': false},
    {'label': 'Đã đọc', 'isSelected': false},
  ];

  List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Event Available!',
      'description': 'Check out this amazing event happening near you.',
      'timestamp': DateTime(2024, 3, 2, 10, 15),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
    },
    {
      'title': 'Flash Sale on Tickets!',
      'description':
          'Limited-time offer: Get 50% off on your next ticket purchase!',
      'timestamp': DateTime(2024, 3, 2, 10, 15),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
    },
    {
      'title': 'Reminder: Concert Tomorrow',
      'description':
          'Don’t forget your favorite artist is performing live tomorrow!',
      'timestamp': DateTime(2024, 3, 2, 10, 15),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
    },
  ];

  void updateFilter(int index) {
    setState(() {
      filterOptions = filterOptions.map((e) {
        e['isSelected'] = false;
        return e;
      }).toList();
      filterOptions[index]['isSelected'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.backgroundBlur75,
        middle: Text(
          'Thông báo',
          style: FontTheme.customStyles['bodyEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.labelPrimaryLight,
            size: 20,
          ),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: false,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: false,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: false,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: false,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  NotificationCard(
                    title: 'Đây là tiêu đề của thông báo',
                    description:
                        'Đừng quên nghệ sĩ yêu thích của bạn sẽ biểu diễn trực tiếp vào ngày mai!',
                    timestamp: DateTime(2024, 3, 2, 10, 15),
                    ifRead: true,
                    thumbnail:
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: AppColors.backgroundBlur75,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      height: 32,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filterOptions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 16 : 8,
                              right: index == filterOptions.length - 1 ? 16 : 0,
                            ),
                            child: GestureDetector(
                              onTap: () => updateFilter(index),
                              child: LabelFilter(
                                label: filterOptions[index]['label'],
                                isSelected: filterOptions[index]['isSelected'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
