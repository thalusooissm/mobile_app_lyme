import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyme_app/ui/core/themes/colors.dart';  // Assuming these are correctly defined

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
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home Screen'),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: AppColors.primary,  // Set the color when selected
          inactiveColor: AppColors.tabUnselected, // Set the color when unselected
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset('icons/discover_icon_selected.svg', width: 28.0, height: 28.0)
                  : SvgPicture.asset('icons/discover_icon.svg', width: 28.0, height: 28.0),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset('icons/search_icon_selected.svg', width: 28.0, height: 28.0)
                  : SvgPicture.asset('icons/search_icon.svg', width: 28.0, height: 28.0),
              label: 'Tìm kiếm',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset('icons/quan_tam_icon_selected.svg', width: 28.0, height: 28.0)
                  : SvgPicture.asset('icons/quan_tam_icon.svg', width: 28.0, height: 28.0),
              label: 'Quan tâm',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset('icons/my_ticket_icon_selected.svg', width: 28.0, height: 28.0)
                  : SvgPicture.asset('icons/my_ticket_icon.svg', width: 28.0, height: 28.0),
              label: 'Vé của tôi',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? SvgPicture.asset('icons/account_icon_selected.svg', width: 28.0, height: 28.0)
                  : SvgPicture.asset('icons/account_icon.svg', width: 28.0, height: 28.0),
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
              return Center(child: Text('Tab 1 content'));
            case 1:
              return Center(child: Text('Tab 2 content'));
            case 2:
              return Center(child: Text('Tab 3 content'));
            case 3:
              return Center(child: Text('Tab 4 content'));
            case 4:
              return Center(child: Text('Tab 5 content'));
            default:
              return Container();
          }
        },
      ),
    );
  }
}