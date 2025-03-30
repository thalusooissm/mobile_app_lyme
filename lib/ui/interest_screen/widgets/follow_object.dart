import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class FollowedObject extends StatefulWidget {
  final String text;
  final String imageUrl;

  FollowedObject({required this.text, required this.imageUrl});

  @override
  _FollowedObjectState createState() => _FollowedObjectState();
}

class _FollowedObjectState extends State<FollowedObject> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          Navigator.pushNamed(context, '/event_detail');
        },
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.nonOpaqueSeparator,
                  width: 0.33,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.text,
                style: FontTheme.customStyles['bodyRegular']?.copyWith(
                  color: AppColors.labelPrimaryLight,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center, // Ensures text is centered
              ),
            )
          ],
        ));
  }
}
