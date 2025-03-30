import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/domain/models/event_detail.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class EventCardImage extends StatefulWidget {
  final EventDetail event;

  EventCardImage({required this.event});

  @override
  _EventCardImageState createState() => _EventCardImageState();
}

class _EventCardImageState extends State<EventCardImage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushNamed(context, '/event_detail');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 0.33,
            color: AppColors.nonOpaqueSeparator,
          ),
          image: DecorationImage(
            image: NetworkImage(widget.event.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
