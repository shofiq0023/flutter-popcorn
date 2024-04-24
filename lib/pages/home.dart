import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Main Home page
class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    HexColor navBarSelectedColor = CustomColors.primaryVoilet;
    HexColor navBarBg = CustomColors.secondaryViolet;
    const bottomNavElevation = 20.0;

    return Scaffold(
      appBar: myAppBar(),
      floatingActionButton: customFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavigationBarTheme(
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
          destinations: [
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
          ],
        ),
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

  /// My appbar
  PreferredSize myAppBar() {
    const appTitle = 'POPCRON';
    const boldWeight = 700.0;
    List<FontVariation> titleWight = const <FontVariation>[
      FontVariation('wght', boldWeight)
    ];
    const borderRadius = 15.0;
    const titleSize = 28.0;
    const appBarHeight = 65.0;
    const appBarElevation = 20.0;
    HexColor appBarBg = CustomColors.secondaryViolet;
    HexColor titleColor = CustomColors.offwhite;

    return PreferredSize(
      preferredSize: const Size.fromHeight(appBarHeight),
      child: AppBar(
        elevation: appBarElevation,
        centerTitle: true,
        backgroundColor: appBarBg,
        title: Text(
          appTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: titleSize,
            fontVariations: titleWight,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  /// Floating action button
  FloatingActionButton customFAB() {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: CustomColors.primaryVoilet,
      child: const Icon(
        Icons.add,
        size: 32.0,
      ),
    );
  }
}
