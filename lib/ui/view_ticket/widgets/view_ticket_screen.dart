import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class ViewTicketScreen extends StatefulWidget {
  @override
  _ViewTicketScreenState createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        middle: Text(
          'Vé',
          style: FontTheme.customStyles['bodyEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new_rounded, 
            color: AppColors.labelPrimaryLight, 
            size: 20,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
                child: Container(
                  color: AppColors.backgroundBlur75, // Adjust opacity if needed
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  _buildEventInfoSection(),
                  SizedBox(height: 8),
                  _buildTicketSection(),
                  SizedBox(height: 8),
                  _buildButtonSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }  

  Widget _buildEventInfoSection() {
    return           
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.backgroundBlur75,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Triển lãm Những Địa hạt Phù du',
                  style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),)
                ],
              ),
              SizedBox(height: 4,),
              Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.33, color: AppColors.nonOpaqueSeparator))),
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Row(children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.fillQuaternary
                        ),
                        child: Icon(Icons.alarm_rounded, size: 20, color: AppColors.labelPrimaryLight,)
                      ),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Hôm nay, 21 Tháng 12, 2024',
                                style: FontTheme.customStyles['footnoteRegular']?.copyWith(color: AppColors.labelPrimaryLight,),)
                            ],
                          ),
                          SizedBox(height: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('20:00 - 23:00',
                                style: FontTheme.customStyles['footnoteRegular']?.copyWith(color: AppColors.labelSecondaryLight,),)
                            ],
                          ),
                        ],
                      )
                    ],),
                    SizedBox(height: 12,),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.fillQuaternary
                        ),
                        child: Icon(Icons.location_on_outlined, size: 20, color: AppColors.labelPrimaryLight,)
                      ),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Nhà hát ABCD',
                                style: FontTheme.customStyles['footnoteRegular']?.copyWith(color: AppColors.labelPrimaryLight,),)
                            ],
                          ),
                          SizedBox(height: 2,),
                          Row(
                            children: [
                              Expanded( // Ensures text wraps properly inside Row
                                child: Text(
                                  '120/32 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP. Hồ Chí Minh',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis, // Prevents overflow issues
                                  style: FontTheme.customStyles['footnoteRegular']
                                      ?.copyWith(color: AppColors.labelSecondaryLight),
                                ),
                              ),
                            ],
                          )                        
                        ],
                      )
                    ],),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
  
  Widget _buildTicketSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Ensures the container is a square
            child: Container(
              width: double.infinity, // Takes full width of its parent
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
                image: DecorationImage(
                  image: NetworkImage('https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)), // Optional: Rounds bottom corners
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50), // Adjust blur strength
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 12),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBlur75,
                    border: Border(top: BorderSide(width: 0.33, color: AppColors.nonOpaqueSeparator))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vé mua ngày 12/12/2024.',
                        style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,),),
                      SizedBox(height: 4,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Loại vé:',
                            style: FontTheme.customStyles['title2Regular']?.copyWith(color: AppColors.labelSecondaryLight,),),
                          SizedBox(width: 4,),
                          Text('Đỉnh nóc',
                            style: FontTheme.customStyles['title2Emphasized']?.copyWith(color: AppColors.labelPrimaryLight,),),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(width: 0.33, color: AppColors.nonOpaqueSeparator))
                        ),
                        child: Row(
                          children: [
                            Text('Khu vực',
                              style: FontTheme.customStyles['subheadlineRegular']?.copyWith(color: AppColors.labelSecondaryLight,),
                            ),
                            SizedBox(width: 4,),
                            Text('A',
                              style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                            ),
                            SizedBox(width: 4,),
                            Text('/',
                              style: FontTheme.customStyles['subheadlineRegular']?.copyWith(color: AppColors.labelSecondaryLight,),
                            ),
                            SizedBox(width: 4,),
                            Text('Hàng',
                              style: FontTheme.customStyles['subheadlineRegular']?.copyWith(color: AppColors.labelSecondaryLight,),
                            ),
                            SizedBox(width: 4,),
                            Text('12',
                              style: FontTheme.customStyles['subheadlineEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),
                            ),
                            SizedBox(width: 4,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )     
        ],
      ),
    );
  }
  
  Widget _buildButtonSection() {
    return           
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: AppColors.gray5,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.festival_rounded, color: AppColors.primary, size: 22),
                  SizedBox(width: 4),
                  Text(
                    'Xem sự kiện',
                    style: FontTheme.customStyles['headlineRegular']
                        ?.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/event_detail');
              },
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: AppColors.gray5,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center, // Center content
                children: [
                  Icon(Icons.arrow_circle_up_rounded, color: AppColors.primary, size: 22),
                  SizedBox(width: 4),
                  Text(
                    'Gửi vé',
                    style: FontTheme.customStyles['headlineRegular']
                        ?.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

