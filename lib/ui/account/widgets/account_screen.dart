import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/domain/models/host.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
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
                  image: AssetImage('images/logo2.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white.withAlpha((0.01 * 255).toInt()),
        enableBackgroundFilterBlur: true,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(),
              SizedBox(height: 24),
              _buildButton(),
              SizedBox(height: 16,),
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
              SizedBox(height: 16,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: _buildSettingCard('Lịch sử vé', 'setting_ticket_history'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _buildSettingCard('Thanh toán', 'setting_payment'),
          ),
        ],
      ),
      SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildSettingCard('Bạn bè', 'setting_friends'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _buildSettingCard('Thông báo', 'setting_noti'),
          ),
        ],
      ),
    ],
  ),
),
              SizedBox(height: 16,),
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
            ],
          ),
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
                        "https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg"),
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
              SvgPicture.asset('icons/linkedin_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('icons/insta_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('icons/fb_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('icons/x_icon.svg'),
              SizedBox(width: 16),
              SvgPicture.asset('icons/web_icon.svg'),
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
      child: Container(
        width: double.infinity,
        child:
          CupertinoButton(
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
            'icons/arrow_right_alt.svg',
            width: 24,
            height: 24,
          ),
        ],
      ),
    ),
  );
}
}
