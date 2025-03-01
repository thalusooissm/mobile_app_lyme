import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';

import 'package:lyme_app/ui/discover/widgets/discover_screen.dart';
import 'package:lyme_app/ui/search/widgets/search_screen.dart' as search;
import 'package:lyme_app/ui/account/widgets/account_screen.dart' as account;
import 'package:lyme_app/ui/my_ticket/widgets/my_ticket_screen.dart'
    as my_ticket;
import 'package:lyme_app/ui/interest_screen/widgets/interest_screen.dart'
    as interest_screen;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    _currentIndex =
        args != null && args['initialTab'] == 'MyTicketScreen' ? 3 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: AppColors.backgroundBlur75,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.tabUnselected,
          items: [
            _buildNavItem('discover', 'Khám phá', 0),
            _buildNavItem('search', 'Tìm kiếm', 1),
            _buildNavItem('quan_tam', 'Quan tâm', 2),
            _buildNavItem('my_ticket', 'Vé của tôi', 3),
            _buildNavItem('account', 'Tài khoản', 4),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        tabBuilder: (context, index) {
          return IndexedStack(
            index: index,
            children: [
              DiscoverScreen(),
              search.SearchScreen(),
              interest_screen.InterestScreen(),
              my_ticket.MyTicketScreen(),
              account.AccountScreen(),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String iconName, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'lib/assets/icons/${iconName}_icon${_currentIndex == index ? "_selected" : ""}.svg',
        width: 24,
        height: 24,
        placeholderBuilder: (context) => CupertinoActivityIndicator(),
      ),
      label: label,
    );
  }
}
