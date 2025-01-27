import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  late FocusNode _emailFocusNode, _passwordFocusNode;
  late bool _showErrorTextEmail, _showErrorTextPassword;
  bool _isPasswordVisible = false;
  String? _errorTextEmail, _errorTextPassword;

  bool get isSignInButtonDisabled {
    return _showErrorTextEmail || _showErrorTextPassword || _email.text.isEmpty || _password.text.isEmpty;
  }

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _showErrorTextEmail = false;
    _showErrorTextPassword = false;
    _emailFocusNode.addListener(_onEmailFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _email.dispose(); // Dispose controllers to prevent memory leaks
    _password.dispose();
    super.dispose();
  }

  void _onEmailFocusChange() {
    if (!_emailFocusNode.hasFocus) {
      _validateEmail();
    }
  }

  void _onPasswordFocusChange() {
    if (!_passwordFocusNode.hasFocus) {
      _validatePassword();
    }
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
    );
    return passwordRegex.hasMatch(password);
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

  void _validatePassword() {
    final String password = _password.text.trim();
    setState(() {
      if (password.isEmpty) {
        _showErrorTextPassword = true;
        _errorTextPassword = 'Trường này là bắt buộc.';
      } else if (!_isValidPassword(password)) {
        _showErrorTextPassword = true;
        _errorTextPassword = 'Mật khẩu chưa đủ mạnh.';
      } else {
        _showErrorTextPassword = false;
        _errorTextPassword = null;
      }
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 78),
            _buildHeader(),
            _buildEmailField(),
            if (_showErrorTextEmail) _buildErrorText(_errorTextEmail!),
            const SizedBox(height: 16),
            _buildPasswordField(),
            if (_showErrorTextPassword) _buildErrorText(_errorTextPassword!),
            const SizedBox(height: 16),
            _buildForgotPassword(),
          Spacer(),            
            _buildSignInButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: AppColors.primaryAsSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: SvgPicture.asset(
            'lib/assets/images/person.svg',
            semanticsLabel: 'Person Icon',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Đăng Nhập',
          style: FontTheme.customStyles['title1Emphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        const SizedBox(height: 8),
        Text(
          'Đăng nhập vào tài khoản Lyme.',
          style: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Email',
              style: FontTheme.customStyles['bodyRegular']
                  ?.copyWith(color: AppColors.labelPrimaryLight),
            ),
            const SizedBox(width: 4),
            Text(
              '*',
              style: FontTheme.customStyles['bodyRegular']
                  ?.copyWith(color: AppColors.red),
            ),
          ],
        ),
        const SizedBox(height: 4),
        CupertinoTextField(
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
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Mật khẩu',
                  style: FontTheme.customStyles['bodyRegular']
                      ?.copyWith(color: AppColors.labelPrimaryLight),
                ),
                const SizedBox(width: 4),
                Text(
                  '*',
                  style: FontTheme.customStyles['bodyRegular']
                      ?.copyWith(color: AppColors.red),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: _togglePasswordVisibility,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: Text(
                  _isPasswordVisible ? 'ẨN MẬT KHẨU' : 'HIỆN MẬT KHẨU',
                  style: FontTheme.customStyles['subheadlineRegular']
                      ?.copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(
            'Mật khẩu phải chứa ít nhất 8 ký tự, có cả chữ hoa, chữ thường, số và ký tự đặc biệt.',
            style: FontTheme.customStyles['caption1Regular']
                ?.copyWith(color: AppColors.labelSecondaryLight),
          ),
        ),
        const SizedBox(height: 4),
        CupertinoTextField(
          focusNode: _passwordFocusNode,
          controller: _password,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          style: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
          obscureText: !_isPasswordVisible,
          cursorColor: AppColors.primary,
          decoration: BoxDecoration(
            color: AppColors.fillTertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          placeholder: 'Nhập mật khẩu',
          placeholderStyle: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelTertiaryLight),
        ),
      ],
    );
  }

  Widget _buildErrorText(String errorText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Text(
        errorText,
        style: FontTheme.customStyles['caption1Regular']
            ?.copyWith(color: AppColors.red),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Row(
      children: [
        Text(
          'Quên Mật Khẩu?',
          style: FontTheme.customStyles['subheadlineRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        CupertinoButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/create_password');
          },
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Center(
            child: Text(
              'Tạo Lại Mật Khẩu',
              style: FontTheme.customStyles['subheadlineRegular']
                  ?.copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: isSignInButtonDisabled ? null : () {
          Navigator.of(context, rootNavigator: true).pushNamed('/home');
        },
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        child: Text(
          'Đăng Nhập',
          style: FontTheme.customStyles['headlineRegular']
              ?.copyWith(color: AppColors.labelPrimaryDark),
        ),
      ),
    );
  }

}
