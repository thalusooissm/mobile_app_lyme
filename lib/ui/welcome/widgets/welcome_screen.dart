import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

import 'package:lyme_app/ui/authenticatio_modal/widgets/authentication_modal.dart';

// import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.99, 0.13),
            end: Alignment(-0.99, -0.13),
            colors: [
              Color(0xFF0894FF),
              Color(0xFFC959DD),
              Color(0xFFFF2E54),
              Color(0xFFFF9004),
            ],
          ),
          shape:
              RoundedRectangleBorder(), // Example: Add a shape, adjust as needed
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.white.withAlpha((0.8 * 255).toInt()), // 20% opacity
            ),
            // Background Image
            Image.asset(
              'assets/images/image.png',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.cover,
            ),
            // Full-screen overlay content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(bottom: 34.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/group.png',
                        width: 136.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Đặt vé. Chia sẻ.\nTham gia dễ dàng.',
                      textAlign: TextAlign.center,
                      style: FontTheme.customStyles['title1Emphasized'],
                    ),
                  ]),
                  const SizedBox(height: 88.0),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth: 0, // Minimum width constraint
                                      minHeight: 0, // Minimum height constraint
                                    ),
                                    child: AuthenticationModal(),
                                  ),
                                );
                              },
                            );
                          },
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromRGBO(250, 45, 72, 1),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 20,
                          ),
                          child: Text(
                            'Bắt Đầu Ngay',
                            style: FontTheme.customStyles['headlineRegular']
                                ?.copyWith(
                              color: AppColors
                                  .labelPrimaryDark, // Specify the white color here
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void funcA() {}



//   void show(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent, // Makes the background transparent
//       isScrollControlled: true, // Allows full-screen content if needed
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(32),
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // Adjust to fit content
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Header Row
//               SizedBox(
//                 width: double.infinity,
//                 height: 156,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SvgPicture.asset(
//                       'images/Frame.svg',
//                       placeholderBuilder: (BuildContext context) =>
//                           CircularProgressIndicator(),
//                     ),
//                     Container(
//                       width: 34,
//                       height: 34,
//                       decoration: ShapeDecoration(
//                         color: Color(0x28787880),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(500),
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: 5,
//                             top: 5,
//                             child: SizedBox(
//                               width: 24,
//                               height: 24,
//                               child: FlutterLogo(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Body Section
//               Text(
//                 'Bắt Đầu',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Đặt vé cho sự kiện, theo dõi những chủ đề nổi bật, và quản lý vé tất cả các sự kiện.',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               // Login Buttons
//               CupertinoButton(
//                 onPressed: () {
//                   // Handle the login button press
//                 },
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 color: Color(0xFFFA2D48),
//                 child: Text(
//                   'Đăng Nhập',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               CupertinoButton(
//                 onPressed: () {
//                   // Handle the create account button press
//                 },
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 color: Color(0x26FA2D48),
//                 child: Text(
//                   'Tạo Tài Khoản',
//                   style: TextStyle(
//                     color: Color(0xFFFA2D48),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Hoặc',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               CupertinoButton(
//                 onPressed: () {
//                   // Handle the button press
//                 },
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 child: Center(
//                   child: Text(
//                     'Bắt Đầu Mà Không Cần Tài Khoản',
//                     style: TextStyle(
//                       color: Color(0xFFFA2D48),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }