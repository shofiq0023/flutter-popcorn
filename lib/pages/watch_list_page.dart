import 'package:popcron/databases/watch_list_database.dart';
import 'package:popcron/templates/watch_list_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({
    super.key,
  });

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  final searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// The search bar
        Container(
          padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          child: TextField(
            controller: searchBarController,
            decoration: const InputDecoration(
              label: Text(
                "Search...",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14.0,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<WatchListDatabase>().clearFilter();
              } else {
                context.read<WatchListDatabase>().filterList(value);
              }
            },
          ),
        ),

        /// The List of Shows
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5.0, bottom: 60.0),
            itemCount: context.watch<WatchListDatabase>().watchLists.length,
            itemBuilder: (BuildContext context, int index) {
              return WatchListItem(
                watchListModel:
                    context.watch<WatchListDatabase>().watchLists[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
