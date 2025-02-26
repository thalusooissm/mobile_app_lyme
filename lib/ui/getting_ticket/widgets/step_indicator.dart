import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';

import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({Key? key, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: currentStep == 1
                ? buildSelectedStepIndicator('Chọn vé')
                : currentStep > 1
                    ? buildDoneStepIndicator('Chọn vé')
                    : buildUnselectedStepIndicator('Chọn vé'),
          ),
          Expanded(
            child: Image.network(
              'https://lh3.googleusercontent.com/pw/AP1GczOwMaJyWAN20L0UBvKfZBSLvi72KEmnBCbQrj2nJMByzo9Ac3b3W_PVWF7bbV67rJm0PCR4t6f7EaPhImFKSzviTfyZGUdZiBt23_ZhhCE5j32RSIYrU37TuJ5YVMRmCGwGSOvV2IGwnyTOb487-b3goA=w298-h31-s-no-gm',
              fit: BoxFit.cover, // Adjust based on your needs
            ),
          ),
          Expanded(
            child: currentStep == 2
                ? buildSelectedStepIndicator('Xác nhận')
                : currentStep > 2
                    ? buildDoneStepIndicator('Xác nhận')
                    : buildUnselectedStepIndicator('Xác nhận'),
          ),
          Expanded(
            child: Image.network(
              'https://lh3.googleusercontent.com/pw/AP1GczOwMaJyWAN20L0UBvKfZBSLvi72KEmnBCbQrj2nJMByzo9Ac3b3W_PVWF7bbV67rJm0PCR4t6f7EaPhImFKSzviTfyZGUdZiBt23_ZhhCE5j32RSIYrU37TuJ5YVMRmCGwGSOvV2IGwnyTOb487-b3goA=w298-h31-s-no-gm',
              fit: BoxFit.cover, // Adjust based on your needs
            ),
          ),
          Expanded(
            child: currentStep == 3
                ? buildSelectedStepIndicator('Thanh toán')
                : currentStep > 3
                    ? buildDoneStepIndicator('Thanh toán')
                    : buildUnselectedStepIndicator('Thanh toán'),
          ),
        ],
      ),
    );
  }

  Widget buildUnselectedStepIndicator(String stepName) {
    return Column(
      children: [
        Icon(Icons.radio_button_unchecked_rounded,
            color: AppColors.labelTertiaryLight),
        SizedBox(height: 4.0),
        Text(
          stepName,
          style: FontTheme.customStyles['caption2Regular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
      ],
    );
  }

  Widget buildSelectedStepIndicator(String stepName) {
    return Column(
      children: [
        Icon(Icons.radio_button_unchecked_rounded, color: AppColors.primary),
        SizedBox(height: 4.0),
        Text(
          stepName,
          style: FontTheme.customStyles['caption2Regular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
      ],
    );
  }

  Widget buildDoneStepIndicator(String stepName) {
    return Column(
      children: [
        Icon(Icons.check_circle_rounded, color: AppColors.primary),
        SizedBox(height: 4.0),
        Text(
          stepName,
          style: FontTheme.customStyles['caption2Regular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
      ],
    );
  }
}
