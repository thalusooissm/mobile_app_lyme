import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class SettingItem extends StatefulWidget {
  final IconData icon;
  final String settingTitle;
  final String settingPath;

  const SettingItem({
    Key? key,
    required this.icon,
    required this.settingTitle,
    required this.settingPath,
  }) : super(key: key);

  @override
  _SettingItemState createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.settingPath);
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: isHovered
              ? AppColors.fillPrimary
              : Colors.transparent, // Change background on hover
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: AppColors.labelTertiaryLight,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.nonOpaqueSeparator,
                        width: 0.33,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        widget.settingTitle,
                        style: FontTheme.customStyles['bodyRegular']?.copyWith(
                          color: AppColors.labelPrimaryLight,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColors.labelTertiaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
