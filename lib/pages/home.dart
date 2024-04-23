import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:popcorn/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: customAppBar(),
      ),
      floatingActionButton: customFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            getCustomBoxShadow(),
          ],
        ),
        child: getGNav(),
      ),
      // bottomNavigationBar:
    );
  }

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

  BoxShadow getCustomBoxShadow() {
    return BoxShadow(
      color: Colors.black.withOpacity(0.25),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }

  GNav getGNav() {
    return GNav(
      backgroundColor: CustomColors.secondaryViolet,
      color: CustomColors.offwhite,
      activeColor: Colors.black,
      tabBackgroundColor: CustomColors.primaryVoilet,
      padding: const EdgeInsets.all(8.0),
      tabMargin: const EdgeInsets.all(20.0),
      gap: 8.0,
      iconSize: 32.0,
      tabs: const [
        GButton(
          icon: Icons.list,
          text: 'Watch List',
        ),
        GButton(
          icon: Icons.explore,
          text: 'Explore',
        ),
        GButton(
          icon: Icons.account_circle,
          text: 'Profile',
        ),
      ],
    );
  }

  AppBar customAppBar() {
    const appTitle = 'POPCRON';

    return AppBar(
      elevation: 10.0,
      title: Text(
        appTitle,
        style: TextStyle(
          color: CustomColors.offwhite,
          fontWeight: FontWeight.bold,
          fontSize: 28.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: CustomColors.secondaryViolet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(15, 15),
          bottomRight: Radius.elliptical(15, 15),
        ),
      ),
    );
  }
}
