import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class TextIconButton extends StatefulWidget {
  final String text; // Text to display on the button
  final String iconAssetPath; // Path to the SVG asset
  final VoidCallback onPressed; // Callback when button is pressed
  final Color color; // Button background color

  TextIconButton({
    required this.text,
    required this.iconAssetPath,
    required this.onPressed,
    this.color = AppColors.labelSecondaryLight,
  });

  @override
  _TextIconButtonState createState() => _TextIconButtonState();
}

class _TextIconButtonState extends State<TextIconButton> {
  late Color _currentColor;
  late Color _initialColor;

  @override
  void initState() {
    super.initState();
    _initialColor = widget.color; // Store the initial color
    _currentColor = _initialColor; // Initialize color with the default color
  }

  void _onTap() {
    setState(() {
      // Change color to a temporary state (e.g., pressed state)
      _currentColor = AppColors.labelQuaternaryLight;
    });

    widget.onPressed(); // Call the passed onPressed callback

    // Revert back to the initial color after a short delay
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _currentColor = _initialColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        decoration: BoxDecoration(
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: FontTheme.customStyles['subheadlineRegular']?.copyWith(
                color: _currentColor, // Update the text color dynamically
              ),
            ),
            SvgPicture.asset(
              widget.iconAssetPath,
              height: 20,
              width: 20,
              // colorFilter: ColorFilter.mode(
              //   _currentColor, // Apply the dynamic color
              //   BlendMode.color,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}