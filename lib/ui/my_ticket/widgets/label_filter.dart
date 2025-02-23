import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/setting/widgets/setting_item.dart';

class LabelFilter extends StatelessWidget {
  final String label;
  final bool isSelected;

  const LabelFilter({Key? key, required this.label, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: isSelected ? AppColors.primary : AppColors.white, // Dummy colors for selection
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Center(
        child: Text(
          label,
          style: FontTheme.customStyles['footnoteEmphasized']?.copyWith(color: isSelected ? Colors.white : Colors.black)
        ),
      ),
    );
  }
}