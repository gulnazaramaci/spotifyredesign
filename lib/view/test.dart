import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/enum/bottom_navigation_enum.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:spotifyredesign/view/home_view.dart';
import 'package:spotifyredesign/view/library_view.dart';
import 'package:spotifyredesign/view/play_view.dart';
import 'package:spotifyredesign/view/premium_view.dart';
import 'package:spotifyredesign/view/search_view.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  BottomNavigationItem _currentTab = BottomNavigationItem.Home;
  ImageConstants imageConstants = ImageConstants.instance;

  Map<BottomNavigationItem, GlobalKey<NavigatorState>> navigationKeys = {
    BottomNavigationItem.Home: GlobalKey<NavigatorState>(),
    BottomNavigationItem.Search: GlobalKey<NavigatorState>(),
    BottomNavigationItem.Play: GlobalKey<NavigatorState>(),
    BottomNavigationItem.Library: GlobalKey<NavigatorState>(),
    BottomNavigationItem.Premium: GlobalKey<NavigatorState>(),
  };

  Map<BottomNavigationItem, Widget> allPages() {
    return {
      BottomNavigationItem.Home: HomeView(),
      BottomNavigationItem.Search: SearchView(),
      BottomNavigationItem.Play: PlayView(),
      BottomNavigationItem.Library: LibraryView(),
      BottomNavigationItem.Premium: PremiumView()
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigationKeys[_currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageConstants.temaBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomBottomNavigationBar(
            currenTab: _currentTab,
            onSelectedTab: (selectedTab) {
              setState(() {
                _currentTab = selectedTab;
              });
            },
            createPage: allPages(),
            createNavigationKeys: navigationKeys,
          ),
        ),
        extendBody: true,
        //floatingActionButton: FloatingActionButtomWidget(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

FloatingActionButton FloatingActionButtomWidget() {
  return FloatingActionButton(
    onPressed: () {},
    child: Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 45,
    ),
  );
}
