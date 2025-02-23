import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';

import 'package:lyme_app/ui/discover/widgets/discover_screen.dart';
import 'package:lyme_app/ui/home/widgets/main_navigation_bar.dart' as main_nav;
import 'package:lyme_app/ui/search/widgets/search_screen.dart' as search;
import 'package:lyme_app/ui/account/widgets/account_screen.dart'as account; 
import 'package:lyme_app/ui/my_ticket/widgets/my_ticket_screen.dart' as my_ticket;
import 'package:lyme_app/ui/interest_screen/widgets/interest_screen.dart' as interest_screen; // Assuming these are correctly defined

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('Home Screen'),
      // ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: AppColors.backgroundBlur75,
          activeColor: AppColors.primary,  // Set the color when selected
          inactiveColor: AppColors.tabUnselected, // Set the color when unselected
         items: [
  BottomNavigationBarItem(
    icon: _currentIndex == 0
        ? SvgPicture.asset(
            'lib/assets/icons/discover_icon_selected.svg',            width: 24,
            height: 24,
            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          )
        : SvgPicture.asset(
            'lib/assets/icons/discover_icon.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          ),
    label: 'Khám phá',
  ),
  BottomNavigationBarItem(
    icon: _currentIndex == 1
        ? SvgPicture.asset(
            'lib/assets/icons/search_icon_selected.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          )
        : SvgPicture.asset(
            'lib/assets/icons/search_icon.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          ),
    label: 'Tìm kiếm',
  ),
  BottomNavigationBarItem(
    icon: _currentIndex == 2
        ? SvgPicture.asset(
            'lib/assets/icons/quan_tam_icon_selected.svg',
                        width: 24,
            height: 24,
            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          )
        : SvgPicture.asset(
            'lib/assets/icons/quan_tam_icon.svg',
            width: 24,
            height: 24,
            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          ),
    label: 'Quan tâm',
  ),
  BottomNavigationBarItem(
    icon: _currentIndex == 3
        ? SvgPicture.asset(
            'lib/assets/icons/my_ticket_icon_selected.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          )
        : SvgPicture.asset(
            'lib/assets/icons/my_ticket_icon.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          ),
    label: 'Vé của tôi',
  ),
  BottomNavigationBarItem(
    icon: _currentIndex == 4
        ? SvgPicture.asset(
            'lib/assets/icons/account_icon_selected.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          )
        : SvgPicture.asset(
            'lib/assets/icons/account_icon.svg',            width: 24,
            height: 24,

            placeholderBuilder: (context) => CupertinoActivityIndicator(),
          ),
    label: 'Tài khoản',
  ),
],
          onTap: (index) {
            setState(() {
              _currentIndex = index;  // Update the selected index
            });
          },
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return DiscoverScreen();
            case 1:
              return search.SearchScreen();
            case 2:
              return interest_screen.InterestScreen();
            case 3:
              return my_ticket.MyTicketScreen();
            case 4:
              return account.AccountScreen();
            default:
              return Container();
          }
        },
      ),
    );
  }
}