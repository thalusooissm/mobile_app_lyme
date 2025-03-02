import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 150.0, sigmaY: 150.0), // Adjust blur intensity
            child: Container(
              color: Colors.black.withAlpha(
                  (0.5 * 255).toInt()), // Semi-transparent black overlay
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_buildNFCLabel()]),
                  SizedBox(height: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildQRSection(),
                  ),
                  SizedBox(height: 16),
                  _buildButtonSection(this.context),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomButton(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 38),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
              offset: Offset(0, 0),
              blurRadius: 32,
            ),
          ],
        ),
        child: CupertinoButton(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'Xong',
              style: FontTheme.customStyles['headlineRegular']
                  ?.copyWith(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );
  }

  Widget _buildNFCLabel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.fillQuaternary,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.2 * 255).toInt()),
            offset: Offset(0, 0),
            blurRadius: 32,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.wifi_tethering_rounded,
              color: AppColors.labelPrimaryDark, size: 24),
          SizedBox(
            width: 9,
          ),
          Text(
            'Đã bật NFC',
            style: FontTheme.customStyles['calloutRegular']
                ?.copyWith(color: AppColors.labelPrimaryDark),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton(
            label: 'Thêm vào ví điện thoại',
            onPressed: () {}, // Add function later
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      color: AppColors.gray5,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center text & icon
        children: [
          Text(
            label,
            style: FontTheme.customStyles['headlineRegular']
                ?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildQRSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.fillPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Bạn có thể đưa thiết bị lại gần máy quét hoặc đưa mã QR để check-in.',
            style: FontTheme.customStyles['headlineRegular']
                ?.copyWith(color: AppColors.labelPrimaryDark),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              'https://lh3.googleusercontent.com/pw/AP1GczN41rJgsMwr3yGRyxwj1mh7PpO8Y08k3c9rhMplPNl243UPdEB4IqfKoi0CrOs45acD0lYu0urHgfVNEJ1jo9ewtaEWYdGwVV4Q5JzpK49Rh1ItV5OtcNJOrHc4-yl5nXdywHWgVikSjNiVrn7_lXvt4A=w1000-h1000-s-no-gm',
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
