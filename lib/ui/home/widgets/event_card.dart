import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
  });

  @override
  State<EventCard> createState() => _EventCard();
}

class _EventCard extends State<EventCard>{

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
      height: 76,
      padding: const EdgeInsets.only(top: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.33, color: AppColors.nonOpaqueSeparator),
          borderRadius: BorderRadius.circular(8),
        ),
      ),child: Image.asset('https://via.placeholder.com/76x76'),
    ),
      ],
    );
  }
}
