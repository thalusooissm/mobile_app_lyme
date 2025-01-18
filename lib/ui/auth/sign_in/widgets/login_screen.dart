import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
// `import 'package:lyme_app/ui/auth/sign_in/view_models/login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  late FocusNode _emailFocusNode, _passwordFocusNode;
  late bool _showErrorTextEmail, _showErrorTextPassword;
  bool _isPasswordVisible = false;
  String? _errorTextEmail, _errorTextPassword;

  bool get isSignInButtonDisabled {
    return _showErrorTextEmail || _showErrorTextPassword;
  }

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _showErrorTextEmail = false;
    _showErrorTextPassword = false;
    // _showInstructionPassword = true;
    // Add a listener to detect focus changes
    _emailFocusNode.addListener(_onEmailFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  void _onEmailFocusChange() {
    if (!_emailFocusNode.hasFocus) {
      // Validate when the field loses focus
      _validateEmail();
    }
  }

  void _onPasswordFocusChange() {
    if (!_passwordFocusNode.hasFocus) {
      // Validate when the field loses focus
      _validatePassword();
    }
  }


  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
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
        _showErrorTextEmail = false; // No error for valid emails
        _errorTextEmail = ''; // Clear the error message
      }
    });
  }

  void _validatePassword() {
    final String password = _password.text.trim();
    setState(() {
      if (password.isEmpty) {
        _showErrorTextPassword = true;
        _errorTextPassword = 'Trường này là bắt buộc.';
      } else {
        _showErrorTextPassword = false;
      }
    });
  }


  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle the visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.white,
      child:



      Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                        'assets/images/person.svg',
                        semanticsLabel: 'Person Icon',
                      ),
                    ),
                    const SizedBox(
                        height:
                            16), // Use only height since Column handles vertical layout
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
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: FontTheme.customStyles['bodyRegular']
                                  ?.copyWith(
                                      color: AppColors.labelPrimaryLight),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '*',
                              style: FontTheme.customStyles['bodyRegular']
                                  ?.copyWith(color: AppColors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        CupertinoTextField(
                          autofocus: true,
                          controller: _email,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          style: FontTheme.customStyles['bodyRegular']
                              ?.copyWith(color: AppColors.labelPrimaryLight),
                          cursorColor: AppColors.primary,
                          focusNode: _emailFocusNode,
                          decoration: BoxDecoration(
                            color: AppColors.fillTertiary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          placeholder: 'Nhập email',
                          placeholderStyle: FontTheme
                              .customStyles['bodyRegular']
                              ?.copyWith(color: AppColors.labelTertiaryLight),
                        ),
                      ],
                    ),
                    if (_showErrorTextEmail)
                      SizedBox(height: 4),
                    if (_showErrorTextEmail)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Text(
                          _errorTextEmail!,
                          style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.red),
                        ),
                      ),
                      SizedBox(height: 16),
                    Column(
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
                                      ?.copyWith(
                                          color: AppColors.labelPrimaryLight),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '*',
                                  style: FontTheme.customStyles['bodyRegular']
                                      ?.copyWith(color: AppColors.red),
                                )
                              ],
                            ),
                            CupertinoButton(
                              onPressed: () {
                                _togglePasswordVisibility();
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Center(
                                child: Text(
                                  _isPasswordVisible ? 'ẨN MẬT KHẨU' : 'HIỆN MẬT KHẨU',
                                  style: FontTheme
                                      .customStyles['subheadlineRegular']
                                      ?.copyWith(
                                    color: AppColors
                                        .primary, // Specify the white color here
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          child: Text(
                            'Mật khẩu phải chứa ít nhất 8 ký tự, có cả chữ hoa, chữ thường, số và ký tự đặc biệt.',
                            style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.labelSecondaryLight),
                          ),
                        ),
                        SizedBox(height: 4),
                        CupertinoTextField(
                          focusNode: _passwordFocusNode,
                          controller: _password,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          style: FontTheme.customStyles['bodyRegular']
                              ?.copyWith(color: AppColors.labelPrimaryLight),
                          obscureText: !_isPasswordVisible,
                          cursorColor: AppColors.primary,
                          decoration: BoxDecoration(
                            color: AppColors.fillTertiary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          placeholder: 'Nhập mật khẩu',
                          placeholderStyle: FontTheme
                              .customStyles['bodyRegular']
                              ?.copyWith(color: AppColors.labelTertiaryLight),
                        ),
                        if (_showErrorTextPassword) SizedBox(height: 4),
                        if (_showErrorTextPassword)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            child: Text(
                              _errorTextPassword!,
                              style: FontTheme.customStyles['caption1Regular']?.copyWith(color: AppColors.red),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text('Quên Mật Khẩu?',
                            style: FontTheme.customStyles['subheadlineRegular']
                                ?.copyWith(
                                    color: AppColors
                                        .labelPrimaryLight) // Specify the white color here
                            ),
                        CupertinoButton(
                          onPressed: () {},
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Center(
                            child: Text(
                              'Tạo Lại Mật Khẩu',
                              style: FontTheme
                                  .customStyles['subheadlineRegular']
                                  ?.copyWith(
                                color: AppColors
                                    .primary, // Specify the white color here
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      onPressed: isSignInButtonDisabled
                          ? null // Disable the button
                          : () {
                        // Handle the sign-in action
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      color: AppColors.primary, // Specify the white color here

                      borderRadius: BorderRadius.circular(12),

                      child: Text(
                        'Đăng Nhập',
                        style:
                            FontTheme.customStyles['headlineRegular']?.copyWith(
                          color: AppColors
                              .labelPrimaryDark, // Specify the white color here
                        ),
                      ),
                    )),
                SizedBox(height: 16,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image container
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                             Container(
                              width: 76,
                              height: 76,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.33,
                                    color: AppColors.nonOpaqueSeparator,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/event_thumb.png',
                                  width: 76,
                                  height: 76,
                                  fit: BoxFit.cover,
                                ),
                              ),

                          ),
                        ],
                      ),
                      SizedBox(width: 8), // Spacing between columns
                      Expanded( // Ensure the second column adjusts to the available space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Organizer info row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: ShapeDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/organizer_avt.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 2,
                                            strokeAlign: BorderSide.strokeAlignOutside,
                                            color: AppColors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4), // Small gap between avatar and text
                                    Flexible( // Prevent text overflow in the organizer info
                                      child: Text(
                                        'Nguyễn Việt Anh, MIFA',
                                        style: FontTheme.customStyles['caption1Regular']?.copyWith(
                                          color: AppColors.labelSecondaryLight,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset('assets/images/place.svg'),
                                    SizedBox(width: 2,),
                                    Text(
                                      'Sắp hết',
                                      style: FontTheme.customStyles['caption1Emphasized']?.copyWith(
                                        color: AppColors.labelPrimaryLight,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 6), // Spacing between rows
                            // Event title row
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible( // Prevent text overflow in the event title
                                  child: Text(
                                    'Triển lãm Những Địa hạt Phù du',
                                    style: FontTheme.customStyles['subHeadlineRegular']?.copyWith(
                                      color: AppColors.labelPrimaryLight,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6), // Spacing between rows
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/schedule.svg'),
                                SizedBox(width: 4,),
                                Text(
                                  '20:00 21/08 (Ngày mai)',
                                  style: FontTheme.customStyles['caption1Regular']?.copyWith(
                                    color: AppColors.labelSecondaryLight,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6,),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/place.svg'),
                                SizedBox(width: 4,),
                                Text(
                                  'TP. Hồ Chí Minh',
                                  style: FontTheme.customStyles['caption1Regular']?.copyWith(
                                    color: AppColors.labelSecondaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ],
            ),
      ),
    );
  }
}
