import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting timestamps
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime timestamp;
  final bool ifRead;
  final String thumbnail;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.ifRead,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.pushNamed(context, '/event_detail');
      },
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.nonOpaqueSeparator,
                width: 0.33,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.nonOpaqueSeparator,
                    width: 0.33,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontTheme.customStyles['subheadlineEmphasized']
                              ?.copyWith(
                            color: ifRead
                                ? AppColors.labelPrimaryLight
                                : AppColors.labelSecondaryLight,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateFormat('dd/MM/yyyy').format(timestamp),
                        style:
                            FontTheme.customStyles['footnoteRegular']?.copyWith(
                          color: ifRead
                              ? AppColors.labelPrimaryLight
                              : AppColors.labelTertiaryLight,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          description,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: FontTheme.customStyles['subheadlineRegular']
                              ?.copyWith(
                            color: ifRead
                                ? AppColors.labelPrimaryLight
                                : AppColors.labelSecondaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
