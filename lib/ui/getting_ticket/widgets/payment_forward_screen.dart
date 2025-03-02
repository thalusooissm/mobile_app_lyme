import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/components/buttons/text_icon_button.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/step_indicator.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroundPrimary,
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.labelPrimaryLight,
            size: 20,
          ),
        ),
        middle: Text(
          'Xác nhận',
          style: FontTheme.customStyles['title3Emphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      child: Stack(
        children: [
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/pw/AP1GczOrX9KPkUKBsI13KB3JirZ8GOjFs84mqi60SZlgki7mxjOUAWapgrdcCJ2SK3P0yIYQxwAEX3faLOnSDpDwhz_Vjtv64zcD_gZ8aJHgrm63yy1xvdfJ_ezzzdYyJ7P63-vQkdgyb5j9t-IMiWpdQ0N_vA=w577-h192-s-no-gm',
                  height: 48,
                  width: 144,
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Bạn sẽ được chuyển hướng đến trang thanh toán của Cổng thanh toán VNPAY-QR trong giây lát.',
                      style: FontTheme.customStyles['bodyRegular']
                          ?.copyWith(color: AppColors.labelPrimaryLight),
                      softWrap: true,
                      textAlign: TextAlign.center, // Ensures text is centered
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 300,
                  child: CupertinoButton(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Tiếp tục',
                        style: FontTheme.customStyles['bodyRegular']
                            ?.copyWith(color: AppColors.white),
                        softWrap: true,
                        textAlign: TextAlign.center, // Ensures text is centered
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/success_getting_screen');
                      }),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          )),
          Positioned(
              bottom: 0, left: 0, right: 0, child: _buildSummarySection())
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
                // decoration: BoxDecoration(
                //   color:
                //       AppColors.backgroundBlur75, // Ensure semi-transparent blur
                // ),
                ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 38),
          decoration: BoxDecoration(
            color:
                AppColors.backgroundBlur75, // Maintain blur effect visibility
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(16)), // Optional rounded corners
          ),
          child: Column(
            children: [
              StepIndicator(currentStep: 3),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
