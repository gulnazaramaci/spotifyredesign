import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BottomNavigationItem { Home, Search, Play, Library, Premium }

class BottomNavigationItemData {
  final String title;
  final IconData icon;
  BottomNavigationItemData({
    required this.title,
    required this.icon,
  });

  static Map<BottomNavigationItem, BottomNavigationItemData> allTabs = {
    BottomNavigationItem.Home:
        BottomNavigationItemData(title: 'Home', icon: Icons.home),
    BottomNavigationItem.Search:
        BottomNavigationItemData(title: 'Search', icon: Icons.search),
    BottomNavigationItem.Play:
        BottomNavigationItemData(title: 'Play', icon: Icons.play_arrow),
    BottomNavigationItem.Library:
        BottomNavigationItemData(title: 'Library', icon: Icons.library_books),
    BottomNavigationItem.Premium:
        BottomNavigationItemData(title: 'Premium', icon: Icons.star),
  };
}
