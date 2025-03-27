import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class ViewTicketScreen extends StatefulWidget {
  @override
  _ViewTicketScreenState createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        backgroundColor: Colors.transparent,
        border: Border(), // Remove bottom shadow
        middle: Text(
          'Vé',
          style: FontTheme.customStyles['bodyEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryDark),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.labelPrimaryDark,
            size: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
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
                  SizedBox(height: 16),
                  _buildEventInfoSection(),
                  SizedBox(height: 8),
                  _buildTicketSection(),
                  SizedBox(height: 8),
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
              'Sử dụng vé',
              style: FontTheme.customStyles['headlineRegular']
                  ?.copyWith(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/qr');
            }),
      ),
    );
  }

  Widget _buildEventInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundBlur75,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Triển lãm Những Địa hạt Phù du',
              style: FontTheme.customStyles['subheadlineEmphasized']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
              softWrap: true,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            Divider(
              thickness: 0.33,
              color: AppColors.nonOpaqueSeparator,
            ),
            const SizedBox(height: 8),
            _buildEventDetail(
              icon: Icons.alarm_rounded,
              title: 'Hôm nay, 21 Tháng 12, 2024',
              subtitle: '20:00 - 23:00',
            ),
            const SizedBox(height: 12),
            _buildEventDetail(
              icon: Icons.location_on_outlined,
              title: 'Nhà hát ABCD',
              subtitle:
                  '120/32 Thích Quảng Đức, Phường 5, Quận Phú Nhuận, TP. Hồ Chí Minh',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetail(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIconContainer(icon),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FontTheme.customStyles['footnoteRegular']
                    ?.copyWith(color: AppColors.labelPrimaryLight),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                softWrap: true,
                style: FontTheme.customStyles['footnoteRegular']
                    ?.copyWith(color: AppColors.labelSecondaryLight),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconContainer(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 0.33, color: AppColors.nonOpaqueSeparator),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.fillQuaternary,
      ),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.labelPrimaryLight,
      ),
    );
  }

  Widget _buildTicketSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.0, // Ensures the container is a square
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    width: 0.33, color: AppColors.nonOpaqueSeparator),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/1018478/pexels-photo-1018478.jpeg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15), // Reduce blur for better readability
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBlur75,
                    border: Border(
                      top: BorderSide(
                          width: 0.33, color: AppColors.nonOpaqueSeparator),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTicketInfoText('Vé mua ngày 12/12/2024.',
                          FontTheme.customStyles['caption1Regular']),
                      const SizedBox(height: 4),
                      _buildTicketDetailRow('Loại vé:', 'Đỉnh nóc'),
                      const SizedBox(height: 4),
                      Divider(
                          color: AppColors.nonOpaqueSeparator, thickness: 0.33),
                      const SizedBox(height: 8),
                      _buildTicketDetailRow('Khu vực', 'A / Hàng 12'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTicketDetailRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: FontTheme.customStyles['subheadlineRegular']
              ?.copyWith(color: AppColors.labelSecondaryLight),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: FontTheme.customStyles['subheadlineEmphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
      ],
    );
  }

  Widget _buildTicketInfoText(String text, TextStyle? style) {
    return Text(
      text,
      style: style?.copyWith(color: AppColors.labelSecondaryLight),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              icon: Icons.festival_rounded,
              label: 'Xem sự kiện',
              onPressed: () => Navigator.of(context).pushNamed('/event_detail'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildButton(
              icon: Icons.arrow_circle_up_rounded,
              label: 'Gửi vé',
              onPressed: () {}, // Add function later
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      color: AppColors.gray5,
      padding: const EdgeInsets.symmetric(vertical: 16),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center text & icon
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 4),
          Text(
            label,
            style: FontTheme.customStyles['headlineRegular']
                ?.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
