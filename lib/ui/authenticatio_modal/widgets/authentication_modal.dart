import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';


class AuthenticationModal extends StatefulWidget {
  @override
  _AuthenticationModalState createState() => _AuthenticationModalState();
}

class _AuthenticationModalState extends State<AuthenticationModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildBody(),
            const SizedBox(height: 32),
            _buildButtons(context),
            const SizedBox(height: 8),
            _buildOrText(),
            const SizedBox(height: 8),
            _buildGuestButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: SvgPicture.asset(
              'images/frame512.svg',
              fit: BoxFit.fitWidth,
              width: 56,
              height: 56,
              placeholderBuilder: (BuildContext context) =>
                  CircularProgressIndicator(),
            ),
          ),
          Container(
            decoration: ShapeDecoration(
              color: AppColors.fillSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500),
              ),
            ),
            padding: EdgeInsets.all(5),
            child: SizedBox(
              width: 24,
              height: 24,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'images/close_icon_24px.svg',
                  placeholderBuilder: (BuildContext context) =>
                      CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bắt Đầu',
          style: FontTheme.customStyles['title2Emphasized']?.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Đặt vé cho sự kiện, theo dõi những chủ đề nổi bật, và quản lý vé tất cả các sự kiện.',
          style: FontTheme.customStyles['bodyRegular']?.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        _buildButton(
          context,
          'Đăng Nhập',
          AppColors.primary,
          AppColors.labelPrimaryDark,
          '/sign_in',
        ),
        const SizedBox(height: 8),
        _buildButton(
          context,
          'Tạo Tài Khoản',
          AppColors.primaryAsSurface,
          AppColors.primary,
          '/sign_up',
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, Color bgColor, Color textColor, String route) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed(route),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          text,
          style: FontTheme.customStyles['headlineRegular']?.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildOrText() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Hoặc',
        textAlign: TextAlign.center,
        style: FontTheme.customStyles['bodyRegular']?.copyWith(color: Colors.black),
      ),
    );
  }

  Widget _buildGuestButton() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Center(
          child: Text(
            'Bắt Đầu Mà Không Cần Tài Khoản',
            style: FontTheme.customStyles['headlineRegular']?.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
