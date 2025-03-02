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
        backgroundColor: Colors.transparent,
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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
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
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
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
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     child: Expanded(
              //       child: ListView.builder(
              //         itemCount: notifications.length,
              //         itemBuilder: (context, index) {
              //           final notification = notifications[index];
              //           return NotificationCard(
              //             title: notification['title'],
              //             description: notification['description'],
              //             timestamp: notification['timestamp'],
              //             ifRead: notification['ifRead'],
              //             thumbnail: notification['thumbnail'],
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
