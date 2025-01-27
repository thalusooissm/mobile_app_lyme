import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  String? _errorTextEmail;
  late FocusNode _emailFocusNode;
  late bool _showErrorTextEmail;

  bool get isSignUpButtonDisabled {
    return _showErrorTextEmail;
  }

  @override
  void initState() {
    super.initState();
    _showErrorTextEmail = false;
    _emailFocusNode = FocusNode();
    _emailFocusNode.addListener(_onEmailFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _email.dispose(); // Dispose of the controller as well.
    super.dispose();
  }

  void _onEmailFocusChange() {
    if (!_emailFocusNode.hasFocus) {
      _validateEmail();
    }
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void _validateEmail() {
    final String email = _email.text.trim();
    setState(() {
      if (email.isEmpty) {
        _showErrorTextEmail = true;
        _errorTextEmail = 'Trường này là bắt buộc.';
      } else if (!_isValidEmail(email)) {
        _showErrorTextEmail = true;
        _errorTextEmail = 'Email không đúng định dạng.';
      } else {
        _showErrorTextEmail = false;
        _errorTextEmail = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                  SizedBox(height: 78),
            _buildLeadingIcon(),
            const SizedBox(height: 16),
            _buildTitle(),
            const SizedBox(height: 16),
            _buildEmailInput(),
            const SizedBox(height: 16),
            if (_showErrorTextEmail && _errorTextEmail != null)
              Text(
                _errorTextEmail!,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            const Spacer(),
            _buildSignUpButton(),

                  ],),
      )
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: isSignUpButtonDisabled ? null : () {
          Navigator.of(context, rootNavigator: true).pushNamed('/create_password');
        },
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          'Tạo Tài Khoản',
          style: FontTheme.customStyles['headlineRegular']
              ?.copyWith(color: AppColors.labelPrimaryDark),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: const Color(0x26FA2D48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: SvgPicture.asset(
            'lib/assets/images/alternate_email.svg',
            fit: BoxFit.fitWidth,
            placeholderBuilder: (BuildContext context) =>
                const CircularProgressIndicator(),
          ),
        );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tạo Tài Khoản',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w700,
            height: 1.27,
            letterSpacing: -0.26,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Nhập email của bạn để tạo tài khoản với Lyme.',
          style: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return CupertinoTextField(
      autofocus: true,
      controller: _email,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      style: FontTheme.customStyles['bodyRegular']
          ?.copyWith(color: AppColors.labelPrimaryLight),
      cursorColor: AppColors.primary,
      focusNode: _emailFocusNode,
      decoration: BoxDecoration(
        color: AppColors.fillTertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      placeholder: 'Nhập email',
      placeholderStyle: FontTheme.customStyles['bodyRegular']
          ?.copyWith(color: AppColors.labelTertiaryLight),
    );
  }
}