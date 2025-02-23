import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/domain/models/topic.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class TopicCard extends StatefulWidget {
  final Topic topic; 

  TopicCard({
    required this.topic,
  });

  @override
  _TopicCardState createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  bool _isPressed = false; // Track if the card is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 136,
        height: 88,
        decoration: ShapeDecoration(
          color: AppColors.gray6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Image.network(
                      widget.topic.image,
                      height: 28,
                      width: 28,
                    ),
                  ),
                  // Use the passed topic name in the Text widget
                  Text(
                    widget.topic.topicName,
                    style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(
                      color: AppColors.labelPrimaryLight, // Adjust color as needed
                    ),
                  ),
                ],
              ),
            ),
            // Overlay when the card is pressed, fill the entire parent container
            if (_isPressed)
              Container(
                color: Colors.white.withAlpha((0.8 * 255).toInt()), // Transparent white overlay
                width: double.infinity,  // Make sure the overlay covers the entire width
                height: double.infinity, // Make sure the overlay covers the entire height
              ),
          ],
        ),
      ),
    );
  }
}