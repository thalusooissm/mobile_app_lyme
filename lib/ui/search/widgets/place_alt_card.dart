import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/domain/models/place.dart';

class PlaceAltCard extends StatefulWidget {
  final Place place;

  const PlaceAltCard({Key? key, required this.place}) : super(key: key);

  @override
  _PlaceAltCardState createState() => _PlaceAltCardState();
}

class _PlaceAltCardState extends State<PlaceAltCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: AppColors.fillTertiary, // Replace AppColors.fillTertiary if not defined
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.place.placeName, // Access the place object via `widget`
                        style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(
                                    color: AppColors.labelPrimaryLight,
                                  ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [                
                      Text(
                        '1000+',
                        style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,
                        ),
                      ),
                      Text(
                        ' Sự kiện',
                        style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('lib/assets/icons/arrow_right_alt.svg'),
            ),
          ],
        ),
      );
  }
}