import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spotifyredesign/core/enum/bottom_navigation_enum.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.currenTab,
    required this.onSelectedTab,
    required this.createPage,
    required this.createNavigationKeys,
  }) : super(key: key);

  final BottomNavigationItem currenTab;
  final ValueChanged<BottomNavigationItem> onSelectedTab;
  final Map<BottomNavigationItem, Widget> createPage;
  final Map<BottomNavigationItem, GlobalKey<NavigatorState>>
      createNavigationKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _createdNavItem(BottomNavigationItem.Home),
          _createdNavItem(BottomNavigationItem.Search),
          _createdNavItem(BottomNavigationItem.Play),
          _createdNavItem(BottomNavigationItem.Library),
          _createdNavItem(BottomNavigationItem.Premium),
        ],
        onTap: (index) => onSelectedTab(
          BottomNavigationItem.values[index],
        ),
      ),
      tabBuilder: (context, index) {
        final currentPage = BottomNavigationItem.values[index];
        return CupertinoTabView(
          builder: (context) {
            return createPage[currentPage]!;
          },
          navigatorKey: createNavigationKeys[currentPage],
        );
      },
    );
  }

  BottomNavigationBarItem _createdNavItem(
      BottomNavigationItem bottomNavigationItem) {
    final currentTab = BottomNavigationItemData.allTabs[bottomNavigationItem];

    return BottomNavigationBarItem(
        icon: Icon(currentTab!.icon), label: currentTab.title);
  }
}
