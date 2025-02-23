import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/setting/widgets/setting_item.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cài đặt', style: FontTheme.customStyles['bodyEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),),
        leading:  Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.labelPrimaryLight, size: 20,),
      ),
      backgroundColor: AppColors.backgroundPrimary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: AppColors.fillTertiary
                ),
                child: Column(children: [
                  SettingItem(icon: Icons.account_balance_rounded, settingTitle: 'Lịch sử giao dịch', settingPath: ''),
                  SettingItem(icon: Icons.book_online_rounded, settingTitle: 'Lịch sử vé', settingPath: ''),
                  SettingItem(icon: Icons.diversity_3_rounded, settingTitle: 'Bạn bè', settingPath: '')
                ],)
              ),
              SizedBox(height: 16,),
                        Container(
                                          clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: AppColors.fillTertiary
                ),
                child: Column(children: [
                  SettingItem(icon: Icons.notifications_rounded, settingTitle: 'Thông báo', settingPath: ''),
                ],)
              ),
              SizedBox(height: 16,),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: AppColors.fillTertiary
                ),
                child: Column(children: [
                  SettingItem(icon: Icons.contact_support_rounded, settingTitle: 'Hỗ trợ', settingPath: ''),
                  SettingItem(icon: Icons.article_rounded, settingTitle: 'Điều khoản và chính sách', settingPath: ''),
                  SettingItem(icon: Icons.add_circle_rounded, settingTitle: 'Theo dõi Lyme', settingPath: '')
                ],)
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSettingItem ({
  //   required IconData icon,
  //   required String settingTitle,
  //   required String settingPath,
  // }) {
  //   return MouseRegion(
  //     onEnter: (_) => setState(() => isHovered = true),
  //     onExit: (_) => setState(() => isHovered = false),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 16),
  //       decoration: BoxDecoration(
  //         color: isHovered ? AppColors.fillPrimary,
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(icon, size: 20, color: AppColors.labelTertiaryLight,),
  //           SizedBox(width: 16,),
  //           Expanded(child: Container(
  //             padding: const EdgeInsets.symmetric(vertical:  16.0),
  //             decoration: BoxDecoration(
  //               border: Border(
  //               bottom: BorderSide(
  //                 color: AppColors.nonOpaqueSeparator,
  //                 width: 0.33,
  //               ),
  //               ),
  //             ),
  //             child: Row(
  //               children: [
  //                 Text(
  //                   settingTitle,
  //                   style: FontTheme.customStyles['bodyRegular']?.copyWith(
  //                   color: AppColors.labelPrimaryLight,
  //                 )),
  //                 SizedBox(width: 16,),
  //                 Icon(Icons.arrow_forward_ios_rounded, size: 12, color: AppColors.labelTertiaryLight,)
  //               ],
  //             ),
  //           ))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
