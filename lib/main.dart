// import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lyme_app/ui/welcome/widgets/welcome_screen.dart';
import 'package:lyme_app/ui/auth/sign_in/widgets/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';

// import 'ui/auth/sign_in/widgets/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: CupertinoApp(
        title: 'Namer App',
        theme: FontTheme.appTheme,
        home: LoginScreen(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}
