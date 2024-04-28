import 'package:flutter/material.dart';
import 'package:popcorn/databases/watch_list_database.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:popcorn/pages/explore_page.dart';
import 'package:popcorn/pages/profile_page.dart';
import 'package:popcorn/pages/watch_list_page.dart';
import 'package:popcorn/templates/custom_appbar.dart';
import 'package:popcorn/templates/custom_bottom_nav.dart';
import 'package:popcorn/templates/watch_list_create_dialog.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/// Main Home page
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    fetchWatchList();
  }
  
  int pageIndex = 0;

  // create
  void createWatchList() {
    showDialog(
      context: context,
      builder: (context) => const WatchListCreateDialog(),
    );
  }

  // read
  void fetchWatchList() {
    context.read<WatchListDatabase>().fetchWatchList();
  }

  // update
  void updateWatchList() {}

  // delete
  void deleteWatchList() {}

  @override
  Widget build(BuildContext context) {
    final watchListDb = context.watch<WatchListDatabase>();

    List<WatchListModel> lists = watchListDb.watchLists;

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
        WatchListPage(
          listItems: lists,
        ),
        const ExplorePage(),
        const ProfilePage()
      ][pageIndex], // Changes the content based on bottom navbar item click
    );
  }

  /// Floating action button
  FloatingActionButton customFAB() {
    return FloatingActionButton(
      onPressed: createWatchList,
      shape: const CircleBorder(),
      backgroundColor: CustomColors.primaryVoilet,
      child: const Icon(
        Icons.add,
        size: 32.0,
      ),
    );
  }
}
