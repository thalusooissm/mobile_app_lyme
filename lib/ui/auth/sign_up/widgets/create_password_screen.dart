import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

class CreatePasswordScreen extends StatefulWidget {
  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  late FocusNode _passwordFocusNode, _confirmPasswordFocusNode;
  late bool _showErrorTextPassword, _showErrorTextConfirmPassword;
  bool _isPasswordVisible = false;
  String? _errorTextPassword, _errorTextConfirmPassword;

  bool get isButtonDisabled {
    return _showErrorTextPassword ||
        _password.text.isEmpty ||
        _confirmPassword.text.isEmpty ||
        _showErrorTextConfirmPassword;
  }

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _showErrorTextPassword = false;
    _showErrorTextConfirmPassword = false;

    _passwordFocusNode.addListener(_onPasswordFocusChange);
    _confirmPasswordFocusNode.addListener(_onConfirmPasswordFocusChange);
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _onPasswordFocusChange() {
    if (!_passwordFocusNode.hasFocus) {
      _validatePassword();
    }
  }

  void _onConfirmPasswordFocusChange() {
    if (!_confirmPasswordFocusNode.hasFocus) {
      _validateConfirmPassword();
    }
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
    );
    return passwordRegex.hasMatch(password);
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

  void _validateConfirmPassword() {
    final String confirmPassword = _confirmPassword.text.trim();
    final String password = _password.text.trim();
    setState(() {
      if (confirmPassword.isEmpty) {
        _showErrorTextConfirmPassword = true;
        _errorTextConfirmPassword = 'Trường này là bắt buộc.';
      } else if (confirmPassword != password) {
        _showErrorTextConfirmPassword = true;
        _errorTextConfirmPassword = 'Mật khẩu chưa trùng khớp.';
      } else {
        _showErrorTextConfirmPassword = false;
        _errorTextConfirmPassword = null;
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
            _buildHeader(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            if (_showErrorTextPassword) _buildErrorText(_errorTextPassword!),
            const SizedBox(height: 16),
            _buildConfirmPasswordField(),
            if (_showErrorTextConfirmPassword)
              _buildErrorText(_errorTextConfirmPassword!),
                        const Spacer(),

            _buildButton(),
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
        SizedBox(height: 78,),
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
          child:           SvgPicture.asset(
            'lib/assets/images/password.svg',
            fit: BoxFit.fitWidth,
            placeholderBuilder: (BuildContext context) =>
                const CupertinoActivityIndicator(),
          ),

        ),
        const SizedBox(height: 16),
        Text(
          'Tạo Mật Khẩu',
          style: FontTheme.customStyles['title1Emphasized']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
        const SizedBox(height: 8),
        Text(
          'Nhập mật khẩu và xác nhận mật khẩu.',
          style: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      label: 'Mật khẩu',
      focusNode: _passwordFocusNode,
      controller: _password,
      placeholder: 'Nhập mật khẩu',
      obscureText: !_isPasswordVisible,
      hideAndShowPassword: true,
      instruction: true
    );
  }

  Widget _buildConfirmPasswordField() {
    return _buildTextField(
      label: 'Xác nhận mật khẩu',
      focusNode: _confirmPasswordFocusNode,
      controller: _confirmPassword,
      placeholder: 'Nhập lại mật khẩu',
      obscureText: !_isPasswordVisible,
      hideAndShowPassword: false,
      instruction: false
    );
  }

  Widget _buildTextField({
    required String label,
    required FocusNode focusNode,
    required TextEditingController controller,
    required String placeholder,
    required bool obscureText,
    required bool hideAndShowPassword,
    required bool instruction,
  }) {
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
                  label,
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
            if (hideAndShowPassword) CupertinoButton(
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
        if (instruction) Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(
            'Mật khẩu phải chứa ít nhất 8 ký tự, có cả chữ hoa, chữ thường, số và ký tự đặc biệt.',
            style: FontTheme.customStyles['caption1Regular']
                ?.copyWith(color: AppColors.labelSecondaryLight),
          ),
        ),
        const SizedBox(height: 4),
                const SizedBox(height: 4),
        CupertinoTextField(
          focusNode: focusNode,
          controller: controller,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          style: FontTheme.customStyles['bodyRegular']
              ?.copyWith(color: AppColors.labelPrimaryLight),
          obscureText: obscureText,
          cursorColor: AppColors.primary,
          decoration: BoxDecoration(
            color: AppColors.fillTertiary,
            borderRadius: BorderRadius.circular(12),
          ),
          placeholder: placeholder,
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

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        onPressed: isButtonDisabled ? null : () {
          Navigator.of(context).pushNamed('/home');
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
}