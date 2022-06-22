import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/color/color_theme.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';

import 'home_view.dart';
import 'library_view.dart';
import 'play_view.dart';
import 'premium_view.dart';
import 'search_view.dart';

class IndexView extends StatefulWidget {
  IndexView({Key? key}) : super(key: key);
  ImageConstants imageConstants = ImageConstants.instance;
  final colors = ColorTheme();
  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  int currentTab = 0;
  final List<Widget> screen = [
    HomeView(),
    SearchView(),
    PlayView(),
    LibraryView(),
    PremiumView()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageStorageContainer(context),
      extendBody: true,
      floatingActionButton: FloatingActionButtomWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }

  FloatingActionButton FloatingActionButtomWidget() {
    return FloatingActionButton(
      onPressed: () {
        // setState(() {
        //   currentScreen = PlayView();
        //   currentTab = 4;
        // });
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PlayView()),
        // );
      },
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 45,
      ),
    );
  }

  Container PageStorageContainer(BuildContext context) {
    return Container(
      decoration: ContainerBoxDecoration(),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }

  BoxDecoration ContainerBoxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(widget.imageConstants.temaBackground),
        fit: BoxFit.cover,
      ),
    );
  }

  BottomAppBar BottomAppBarWidget() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: BottomAppBarWidgetContainer(),
    );
  }

  Container BottomAppBarWidgetContainer() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[BottomAppBarLeftMenu(), BottomAppBarRightMenu()],
      ),
    );
  }

  Row BottomAppBarLeftMenu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          enableFeedback: false,
          onPressed: () {
            setState(() {
              currentScreen = HomeView();
              currentTab = 0;
            });
          },
          minWidth: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home,
                  color: currentTab == 0
                      ? widget.colors.pastelGreen
                      : Colors.white),
              Text(
                'Home',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    color: currentTab == 0
                        ? widget.colors.pastelGreen
                        : Colors.white),
              )
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              currentScreen = SearchView();
              currentTab = 1;
            });
          },
          minWidth: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search,
                  color: currentTab == 1
                      ? widget.colors.pastelGreen
                      : Colors.white),
              Text(
                'Search',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    color: currentTab == 1
                        ? widget.colors.pastelGreen
                        : Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }

  Row BottomAppBarRightMenu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              currentScreen = LibraryView();
              currentTab = 2;
            });
          },
          minWidth: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.library_music,
                  color: currentTab == 2
                      ? widget.colors.pastelGreen
                      : Colors.white),
              Text(
                'Library',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    color: currentTab == 2
                        ? widget.colors.pastelGreen
                        : Colors.white),
              )
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            setState(() {
              currentScreen = PremiumView();
              currentTab = 3;
            });
          },
          minWidth: 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome,
                  color: currentTab == 3
                      ? widget.colors.pastelGreen
                      : Colors.white),
              Text(
                'Premium',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    color: currentTab == 3
                        ? widget.colors.pastelGreen
                        : Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
