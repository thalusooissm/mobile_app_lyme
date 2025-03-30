import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  _SignUpSuccessState createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10), // Adjust blur intensity
              child: Container(
                color: AppColors.backgroundBlur75, // 20% white overlay
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primary,
                    size: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Bạn đã tạo tài khoản thành công!',
                    style: FontTheme.customStyles['title3Emphasized']
                        ?.copyWith(color: AppColors.labelPrimaryLight),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nhấn Tiếp Tục để vào Lyme ngay thôi.',
                    style: FontTheme.customStyles['title3Emphasized']
                        ?.copyWith(color: AppColors.labelSecondaryLight),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            left: 16,
            right: 16,
            child: CupertinoButton(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(32),
              padding: const EdgeInsets.symmetric(vertical: 16),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Tiếp Tục',
                style: FontTheme.customStyles['headlineRegular']
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
