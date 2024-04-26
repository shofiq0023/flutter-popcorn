import 'package:flutter/material.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/pages/explore_page.dart';
import 'package:popcorn/pages/profile_page.dart';
import 'package:popcorn/pages/watch_list_page.dart';
import 'package:popcorn/templates/custom_appbar.dart';
import 'package:popcorn/templates/custom_bottom_nav.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/// Main Home page
class _HomeState extends State<Home> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      floatingActionButton: customFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: MyNavigationBar(onIndexSelected: (index) {
        // Callback function to get the page index
        setState(() {
          pageIndex = index;
        });
      }),
      body: [
        const WatchListPage(),
        const ExplorePage(),
        const ProfilePage()
      ][pageIndex], // Changes the content based on bottom navbar item click
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
