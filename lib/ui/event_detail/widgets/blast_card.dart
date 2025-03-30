import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/domain/models/blast.dart';

class BlastCard extends StatefulWidget {
  final Blast blast;

  const BlastCard({Key? key, required this.blast}) : super(key: key);

  @override
  _BlastCardState createState() => _BlastCardState();
}

class _BlastCardState extends State<BlastCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fillTertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 0.33,
                    color: AppColors.nonOpaqueSeparator,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Lực Nguyễn',
                          style: FontTheme.customStyles['footnoteRegular']
                              ?.copyWith(
                            color: AppColors.labelPrimaryDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        Text(
                          ' • ',
                          style: FontTheme.customStyles['footnoteRegular']
                              ?.copyWith(
                            color: AppColors.labelSecondaryDark,
                          ),
                        ),
                        Text(
                          'Host',
                          style: FontTheme.customStyles['footnoteRegular']
                              ?.copyWith(
                            color: AppColors.labelSecondaryDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Đăng vào 22 Tháng 12 2024 lúc 22:00',
                      style:
                          FontTheme.customStyles['caption2Regular']?.copyWith(
                        color: AppColors.labelSecondaryDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'BTC sẽ chuẩn bị nước uống cho tất cả mọi người, nhưng bạn hãy nhớ mang theo bình nước của mình để có thể lấy nước khi cần nhé! Điều này sẽ giúp bạn luôn có nước uống sẵn sàng và giữ cho cơ thể được cung cấp đủ nước trong suốt sự kiện.',
            style: FontTheme.customStyles['footnoteRegular']?.copyWith(
              color: AppColors.labelPrimaryDark,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
