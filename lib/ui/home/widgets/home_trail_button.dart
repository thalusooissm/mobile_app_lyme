import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/data/services/api/models/places_service.dart';
import 'package:lyme_app/domain/models/topic.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class MainTrailButton extends StatefulWidget {
  final BuildContext context;

  MainTrailButton({required this.context});

  @override
  _MainTrailButtonState createState() => _MainTrailButtonState();
}

class _MainTrailButtonState extends State<MainTrailButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: CupertinoButton(
              color: AppColors.fillPrimary,
              borderRadius: BorderRadius.circular(20),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Icon(
                Icons.notifications_rounded,
                size: 20,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              }),
        ),
        SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 28,
          height: 28,
          child: CupertinoButton(
              color: AppColors.fillPrimary,
              borderRadius: BorderRadius.circular(20),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Icon(
                Icons.maps_ugc_rounded,
                size: 20,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              }),
        ),
      ],
    );
  }
}
