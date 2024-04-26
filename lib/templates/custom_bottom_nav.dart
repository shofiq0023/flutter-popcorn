import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/global.dart';

class MyNavigationBar extends StatefulWidget {
  // Callback function to pass the current page index to the Home widget
  final Function(int) onIndexSelected;
  const MyNavigationBar({super.key,  required this.onIndexSelected});
  
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int pageIndex = 0;

  HexColor navBarSelectedColor = CustomColors.primaryVoilet;
  HexColor navBarBg = CustomColors.secondaryViolet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 10,
            ),
          ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: CustomColors.offwhite),
          ),
        ),
        child: NavigationBar(
          indicatorColor: navBarSelectedColor,
          backgroundColor: navBarBg,
          selectedIndex: pageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              pageIndex = index;
            });
      
            // Calls the index passing function
            widget.onIndexSelected(index);
          },
          destinations: getNavigations(),
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
