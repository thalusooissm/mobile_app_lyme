import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class ChatCard extends StatelessWidget {
  final String chatName;
  final String lastMessage;
  final DateTime timestamp;
  final bool ifRead;
  final String thumbnail;
  final String chatType;

  const ChatCard({
    Key? key,
    required this.chatName,
    required this.lastMessage,
    required this.timestamp,
    required this.ifRead,
    required this.thumbnail,
    required this.chatType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.nonOpaqueSeparator,
                width: 0.33,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chatName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FontTheme.customStyles['subheadlineEmphasized']
                            ?.copyWith(
                          color: AppColors.labelPrimaryLight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (chatType != 'normal')
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                          color: AppColors.fillTertiary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          chatType == 'com' ? 'Cộng Đồng' : 'Ban Tổ Chức',
                          style: FontTheme.customStyles['caption2Regular']
                              ?.copyWith(
                            color: AppColors.labelSecondaryLight,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('dd/MM/yyyy').format(timestamp),
                      style:
                          FontTheme.customStyles['footnoteRegular']?.copyWith(
                        color: AppColors.labelSecondaryLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            FontTheme.customStyles['footnoteRegular']?.copyWith(
                          color: ifRead
                              ? AppColors.labelSecondaryLight
                              : AppColors.labelPrimaryLight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (!ifRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
