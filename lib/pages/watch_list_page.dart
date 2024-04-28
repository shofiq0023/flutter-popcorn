import 'package:flutter/material.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:popcorn/templates/watch_list_items.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5.0, bottom: 60.0),
            itemCount: widget.listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return WatchListItem(
                title: widget.listItems[index].title,
                type: widget.listItems[index].type,
                priority: widget.listItems[index].priority,
              );
            },
          ),
        ),
      ],
    );
  }
}
