// import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
// import 'package:realm/realm.dart';

// import 'package:flutter/material.dart';
import 'package:lyme_app/ui/auth/sign_in/widgets/sign_in_screen.dart';
import 'package:lyme_app/ui/auth/sign_up/widgets/sign_up_screen.dart';
import 'package:lyme_app/ui/chat/widgets/chat_screen.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/payment_forward_screen.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/success_getting_screen.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/ticket_confirmation_screen.dart';
import 'package:lyme_app/ui/getting_ticket/widgets/ticket_type_selection_screen.dart';
import 'package:lyme_app/ui/home/widgets/home_screen.dart';
import 'package:lyme_app/ui/notification/widgets/notification_screen.dart';
import 'package:lyme_app/ui/setting/widgets/setting_screen.dart';
import 'package:lyme_app/ui/view_ticket/widgets/use_ticket_qr_screen.dart';
import 'package:lyme_app/ui/welcome/widgets/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:lyme_app/ui/core/themes/theme.dart';
import 'package:lyme_app/ui/auth/sign_up/widgets/create_password_screen.dart';
import 'package:lyme_app/ui/event_detail/widgets/event_detail_screen.dart';
import 'package:lyme_app/ui/view_ticket/widgets/view_ticket_screen.dart';

void main() {
  runApp(LymeApp());
}

class LymeApp extends StatelessWidget {
  const LymeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LymeAppState(),
      child: CupertinoApp(
        title: 'Lyme',
        theme: FontTheme.appTheme,
        initialRoute: '/home',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return CupertinoPageRoute(builder: (_) => WelcomeScreen());
            case '/sign_in':
              return CupertinoPageRoute(builder: (_) => SignInScreen());
            case '/sign_up':
              return CupertinoPageRoute(builder: (_) => SignUpScreen());
            case '/home':
              return CupertinoPageRoute(builder: (_) => HomeScreen());
            case '/setting':
              return CupertinoPageRoute(builder: (_) => SettingScreen());
            case '/create_password':
              return CupertinoPageRoute(builder: (_) => CreatePasswordScreen());
            case '/event_detail':
              return CupertinoPageRoute(builder: (_) => EventDetailScreen());
            case '/view_ticket':
              return CupertinoPageRoute(builder: (_) => ViewTicketScreen());
            case '/select_ticket_type':
              return CupertinoPageRoute(
                  builder: (_) => TicketTypeSelectScreen());
            case '/ticket_confirmation':
              return CupertinoPageRoute(
                  builder: (_) => TicketConfirmationScreen());
            case '/payment_forward_request':
              return CupertinoPageRoute(builder: (_) => PaymentScreen());
            case '/success':
              return CupertinoPageRoute(builder: (_) => SuccessScreen());
            case '/qr':
              return CupertinoPageRoute(builder: (_) => QRScreen());
            case '/notification':
              return CupertinoPageRoute(builder: (_) => NotificationScreen());
            case '/chat':
              return CupertinoPageRoute(builder: (_) => ChatScreen());
            default:
              return CupertinoPageRoute(builder: (_) => HomeScreen());
          }
        },
      ),
    );
  }
}

class LymeAppState extends ChangeNotifier {}
