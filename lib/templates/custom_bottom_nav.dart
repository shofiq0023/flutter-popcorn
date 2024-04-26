import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/global.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int pageIndex = 0;

  HexColor navBarSelectedColor = CustomColors.primaryVoilet;
  HexColor navBarBg = CustomColors.secondaryViolet;
  double bottomNavElevation = 20.0;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(color: CustomColors.offwhite),
        ),
      ),
      child: NavigationBar(
        elevation: bottomNavElevation,
        indicatorColor: navBarSelectedColor,
        backgroundColor: navBarBg,
        selectedIndex: pageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        destinations: getNavigations(),
      ),
    );
  }

  /// Get the bottom navbar icon's color on click
  Color getIconColor({currentIndex, targetIndex}) {
    if (currentIndex == targetIndex) {
      return Colors.black;
    } else {
      return CustomColors.offwhite;
    }
  }

  /// Navigations list
  List<NavigationDestination> getNavigations() {
    return [
      NavigationDestination(
        selectedIcon: const Icon(Icons.list_alt),
        icon: Icon(
          Icons.list,
          color: getIconColor(currentIndex: pageIndex, targetIndex: 0),
        ),
        label: 'Watch List',
      ),
      NavigationDestination(
        selectedIcon: const Icon(Icons.explore_outlined),
        icon: Icon(
          Icons.explore,
          color: getIconColor(currentIndex: pageIndex, targetIndex: 1),
        ),
        label: 'Explore',
      ),
      NavigationDestination(
        selectedIcon: const Icon(Icons.account_circle_outlined),
        icon: Icon(
          Icons.account_circle,
          color: getIconColor(currentIndex: pageIndex, targetIndex: 2),
        ),
        label: 'Profile',
      ),
    ];
  }
}
