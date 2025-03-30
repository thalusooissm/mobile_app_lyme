import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/domain/models/event_detail.dart';
import 'package:lyme_app/ui/components/event_card.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/domain/models/host.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        trailing: SizedBox(
          width: 28,
          height: 28,
          child: CupertinoButton(
              color: AppColors.fillPrimary,
              borderRadius: BorderRadius.circular(20),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Icon(
                Icons.settings_rounded,
                size: 20,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              }),
        ),
        leading: Row(
          children: [
            Text(
              'Tài Khoản',
              style: FontTheme.customStyles['title3Emphasized']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
            ),
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
            ),
          ],
        ),
        backgroundColor: Colors.white.withAlpha((0.01 * 255).toInt()),
        enableBackgroundFilterBlur: true,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            _buildSectionHeader(),
            SizedBox(height: 24),
            _buildButton(),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.33,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: AppColors.nonOpaqueSeparator,
                    ),
                  ),
                ),
              ),
            ),
            _buildHeadingButton('Cài đặt nhanh', '/setting'),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildSettingCard('Lịch sử vé', '/setting'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildSettingCard('Thanh toán', '/setting'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSettingCard('Bạn bè', '/setting'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildSettingCard('Thông báo', '/setting'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.33,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: AppColors.nonOpaqueSeparator,
                    ),
                  ),
                ),
              ),
            ),
            _buildHeadingButton('Đang Host', '/setting'),
            SizedBox(
              height: 16,
            ),
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
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://lh3.googleusercontent.com/pw/AP1GczMuhDy9EbDXwhmL4iP8eQh_ErOaMWfwWasMRQ55HaMlKJh8mSFxdmWAUlSk61GJtFpW4E3awj1pcuO9SNOudHsukjIsfxHBF6ARhgVmMOb0WSGsQCqvN4aiWklgQO_eZ76slFhIk_0QMrbRkXJLMZGspw=w1448-h1930-s-no-gm"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.33, color: Color(0x56545456)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: ShapeDecoration(
                  color: AppColors.primaryAsSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  '@thalusooissm',
                  style: FontTheme.customStyles['footnoteRegular']
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Thanh Lực Nguyễn',
            style: FontTheme.customStyles['title2Emphasized']
                ?.copyWith(color: AppColors.labelPrimaryLight),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '12',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Sự kiện',
                    style: FontTheme.customStyles['footnoteRegular']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Row(
                children: [
                  Text(
                    '112',
                    style: FontTheme.customStyles['footnoteEmphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Đã tham gia',
                    style: FontTheme.customStyles['footnoteRegular']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset('lib/assets/icons/linkedin_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('lib/assets/icons/insta_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('lib/assets/icons/fb_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('lib/assets/icons/x_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('lib/assets/icons/web_icon.svg'),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: () {},
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(50),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
          child: Text(
            'Chỉnh sửa thông tin',
            style: FontTheme.customStyles['subheadlineRegular']
                ?.copyWith(color: AppColors.labelPrimaryDark),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    String label,
    String navigatorPath,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, navigatorPath);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.fillTertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: FontTheme.customStyles['footnoteEmphasized']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset(
              'lib/assets/icons/arrow_right_alt.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  _buildHeadingButton(String label, String navigatorPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: FontTheme.customStyles['title3Emphasized']
                ?.copyWith(color: AppColors.labelPrimaryLight),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, navigatorPath);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Xem thêm',
                  style: FontTheme.customStyles['subheadlineRegular']
                      ?.copyWith(color: AppColors.gray),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 20, color: AppColors.gray),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
