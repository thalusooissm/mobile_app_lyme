import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTabBar extends StatefulWidget {
  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  int _currentIndex = 0; // Keep track of the selected tab

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.compass),
            label: 'Khám phá',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: 'Quan tâm',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ticket),
            label: 'Vé của tôi',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => ExploreScreen(),
              ),
            );
          case 1:
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          case 2:
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => FavoritesScreen(),
              ),
            );
          case 3:
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => TicketsScreen(),
              ),
            );
          case 4:
            return Navigator(
              onGenerateRoute: (settings) => CupertinoPageRoute(
                builder: (context) => AccountScreen(),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
