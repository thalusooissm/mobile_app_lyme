import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/chat/widgets/chat_card.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/my_ticket/widgets/label_filter.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> filterOptions = [
    {'label': 'Tất cả', 'isSelected': true},
    {'label': 'Cộng đồng', 'isSelected': false},
    {'label': 'Bạn bè', 'isSelected': false},
  ];

  final List<Map<String, dynamic>> chatData = [
    {
      'chatName': 'Nhóm Bạn Bè',
      'lastMessage': 'Hẹn gặp lại mọi người tối nay nhé!',
      'timestamp': DateTime(2024, 3, 2, 14, 30),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
      'chatType': 'normal',
    },
    {
      'chatName': 'Cộng Đồng Lý Me',
      'lastMessage': 'Chào mừng thành viên mới!',
      'timestamp': DateTime(2024, 3, 1, 9, 15),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
      'chatType': 'com',
    },
    {
      'chatName': 'Ban Tổ Chức Sự Kiện',
      'lastMessage': 'Nhớ kiểm tra lại lịch trình sự kiện.',
      'timestamp': DateTime(2024, 2, 29, 18, 45),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg',
      'chatType': 'org',
    },
    {
      'chatName': 'Team Dự Án',
      'lastMessage': 'Báo cáo tuần này đã hoàn thành chưa?',
      'timestamp': DateTime(2024, 3, 3, 10, 15),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg',
      'chatType': 'normal',
    },
    {
      'chatName': 'Gia Đình',
      'lastMessage': 'Cuối tuần này về thăm nhà nhé con!',
      'timestamp': DateTime(2024, 3, 4, 12, 45),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg',
      'chatType': 'normal',
    },
    {
      'chatName': 'Lớp Học Flutter',
      'lastMessage': 'Ai cần tài liệu bài giảng thì nhắn mình nhé!',
      'timestamp': DateTime(2024, 3, 5, 16, 30),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/3778234/pexels-photo-3778234.jpeg',
      'chatType': 'com',
    },
    {
      'chatName': 'Đối Tác Kinh Doanh',
      'lastMessage': 'Chúng ta sẽ họp vào thứ 5 nhé.',
      'timestamp': DateTime(2024, 3, 6, 8, 50),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/3183197/pexels-photo-3183197.jpeg',
      'chatType': 'org',
    },
    {
      'chatName': 'Câu Lạc Bộ Thiện Nguyện',
      'lastMessage': 'Cuối tuần này có buổi gây quỹ, ai tham gia được không?',
      'timestamp': DateTime(2024, 3, 7, 19, 20),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/3184424/pexels-photo-3184424.jpeg',
      'chatType': 'com',
    },
    {
      'chatName': 'Nhóm Game Thứ 7',
      'lastMessage': 'Tối nay Warzone hay Valorant đây?',
      'timestamp': DateTime(2024, 3, 8, 21, 15),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/907221/pexels-photo-907221.jpeg',
      'chatType': 'normal',
    },
    {
      'chatName': 'Cộng Đồng Sách',
      'lastMessage': 'Thảo luận về cuốn "Atomic Habits" nào!',
      'timestamp': DateTime(2024, 3, 9, 14, 30),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/46274/pexels-photo-46274.jpeg',
      'chatType': 'com',
    },
    {
      'chatName': 'Ban Truyền Thông',
      'lastMessage': 'Bài viết này đã được duyệt chưa?',
      'timestamp': DateTime(2024, 3, 10, 11, 00),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/1181622/pexels-photo-1181622.jpeg',
      'chatType': 'org',
    },
    {
      'chatName': 'Team UI/UX',
      'lastMessage': 'Mockup này cần chỉnh sửa gì không?',
      'timestamp': DateTime(2024, 3, 11, 9, 45),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/3183161/pexels-photo-3183161.jpeg',
      'chatType': 'normal',
    },
    {
      'chatName': 'Hội Đồng Quản Trị',
      'lastMessage': 'Tài liệu đã được gửi qua email.',
      'timestamp': DateTime(2024, 3, 12, 7, 30),
      'ifRead': false,
      'thumbnail':
          'https://images.pexels.com/photos/3184307/pexels-photo-3184307.jpeg',
      'chatType': 'org',
    },
    {
      'chatName': 'Nhóm Chạy Bộ',
      'lastMessage': 'Sáng mai chạy ở công viên lúc 6h nhé!',
      'timestamp': DateTime(2024, 3, 13, 5, 30),
      'ifRead': true,
      'thumbnail':
          'https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg',
      'chatType': 'com',
    }
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
          'Chat',
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
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    final chat = chatData[index];
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 150 : 0),
                      child: ChatCard(
                        chatName: chat['chatName'],
                        lastMessage: chat['lastMessage'],
                        timestamp: chat['timestamp'],
                        ifRead: chat['ifRead'],
                        thumbnail: chat['thumbnail'],
                        chatType: chat['chatType'],
                      ),
                    );
                  },
                ),
              ),
            ],
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
