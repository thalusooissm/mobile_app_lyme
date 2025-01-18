import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class TopicCard extends StatefulWidget {
  final String iconAssetPath; // Path for the SVG icon
  final String topicName; // Name of the topic to display

  // Constructor to accept the icon path and topic name
  TopicCard({
    required this.iconAssetPath,
    required this.topicName,
  });

  @override
  _TopicCardState createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  bool _isPressed = false; // Track if the card is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true; // Set to true when the card is pressed down
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false; // Reset when the tap is released
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false; // Reset if the tap is canceled
        });
      },
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
            // The card content (always visible)
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
                    child: SvgPicture.asset(
                      widget.iconAssetPath,
                      height: 28,
                      width: 28,
                    ),
                  ),
                  // Use the passed topic name in the Text widget
                  Text(
                    widget.topicName,
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