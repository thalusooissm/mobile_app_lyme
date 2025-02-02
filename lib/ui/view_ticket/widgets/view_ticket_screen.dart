import 'dart:convert';
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
        middle: Text('Cài đặt', style: FontTheme.customStyles['bodyEmphasized']?.copyWith(color: AppColors.labelPrimaryLight,),),
        leading:  Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.labelPrimaryLight, size: 20,),
      ), child: SafeArea(child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
          )
        ],
      )),);
  }
}