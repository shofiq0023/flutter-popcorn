import 'package:popcron/models/watch_list.dart';
import 'package:popcron/templates/watch_list_items.dart';
import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  final List<WatchListModel> listItems;

  const WatchListPage({
    super.key,
    required this.listItems,
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
              setState(() {
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5.0, bottom: 60.0),
            itemCount: widget.listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return WatchListItem(
                watchListModel: widget.listItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
