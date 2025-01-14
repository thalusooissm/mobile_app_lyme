import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import this if you're using an SVG image

class PlaceCard extends StatefulWidget {
  final String placeName; // Place name to be passed as a parameter
  final String imagePath; // Path for the background image

  PlaceCard({required this.placeName, required this.imagePath});

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap action here (optional)
        print('Tapped on place: ${widget.placeName}');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.33,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0x493C3C43),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imagePath, // Using the image path passed from the widget
                  fit: BoxFit.cover, // Ensure image covers the area
                ),
              ),
            ),
            // Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black.withAlpha((0.75 * 255).toInt()),
                      Colors.black.withAlpha((0.75 * 255).toInt()),
                    ],
                    stops: [
                      0.4, // 80%
                      0.8, // 100%
                      1.0, // 100%
                    ],
                    ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Text
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                widget.placeName, // Access the place name from the widget
                style: FontTheme.customStyles['bodyRegular']?.copyWith(
                color: AppColors.white, // Adjust text color
                ),
              ),
              ),
            ),
    
          ],
        ),
      ),
    );
  }
}