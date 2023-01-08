import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:sharble/pages/home/home.page.dart';
import 'package:sharble/pages/room/rooms.page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  PersistentTabController? _controller;
  final ScrollController _homeController = ScrollController();
  PageController pageViewController = PageController(initialPage: 0);
  onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
      pageViewController.animateToPage(
        _selectedIndex,
        duration: Duration(microseconds: 5),
        curve: Curves.bounceInOut,
      );
    });
  }

  @override
  initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    setState(() {});

    // AuthRequest().getMerchantProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        decoration: NavBarDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 8,
              spreadRadius: 3,
              color: Colors.grey.shade400,
              offset: Offset(3, 8))
        ]),
        screens: const [
          HomePage(),
          Center(
            child: Text("Rooms"),
          ),
          Center(
            child: Text("settings"),
          ),
        ],
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        items: [
          PersistentBottomNavBarItem(
            icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 25,
                child: Image.asset("assets/images/home.png")),
            onSelectedTabPressWhenNoScreensPushed: () {},
            title: "Home",
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).textTheme.bodyText1!.color!,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          PersistentBottomNavBarItem(
            icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 25,
                child: Image.asset("assets/images/rooms.png")),
            title: 'Rooms',
            onSelectedTabPressWhenNoScreensPushed: () {},
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).textTheme.bodyText1!.color!,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          PersistentBottomNavBarItem(
            onSelectedTabPressWhenNoScreensPushed: () {},
            icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: 25,
                child: Image.asset("assets/images/settings.png")),
            title: 'Settings',
            activeColorPrimary: Theme.of(context).primaryColor,
            inactiveColorPrimary: Theme.of(context).textTheme.bodyText1!.color!,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
      ),
    );
  }
}
