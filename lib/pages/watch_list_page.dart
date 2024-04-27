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
    // List<WatchListItemModel> listItems = [
    //   WatchListItemModel(
    //       title: "Eminence in Shadow S02",
    //       type: "Anime series",
    //       priority: 1,
    //       finished: true),
    //   WatchListItemModel(title: "Paprika", type: "Anime movie", priority: 2),
    //   WatchListItemModel(
    //       title: "The Ancient Magus Bride",
    //       type: "Anime series",
    //       priority: 3,
    //       finished: true),
    //   WatchListItemModel(
    //       title: "Mashle Magic and Muscles: Beyond Magic and Stuff",
    //       type: "Anime series"),
    //   WatchListItemModel(
    //       title: "The Apothecary Diaries", type: "Anime series", priority: 3),
    //   WatchListItemModel(
    //       title: "Invincible Season 2", type: "Cartoon", priority: 3),
    //   WatchListItemModel(
    //       title: "Land of the Lustrous", type: "Anime series", priority: 2),
    //   WatchListItemModel(title: "House M.D", type: "Series", priority: 2),
    //   WatchListItemModel(title: "Euphoria", type: "Series"),
    //   WatchListItemModel(title: "Nimona", type: "Movie"),
    //   WatchListItemModel(title: "Avenger Infinity War", type: "Movie"),
    // ];

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
                finished: widget.listItems[index].isFinished,
              );
            },
          ),
        ),
      ],
    );
  }
}
