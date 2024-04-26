import 'package:flutter/material.dart';
import 'package:popcorn/models/watch_list_model.dart';
import 'package:popcorn/templates/watch_list_items.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    List<WatchListItemModel> listItems = [
      WatchListItemModel(
          title: "Eminence in Shadow S02", type: "Anime series", priority: 1, finished: true),
      WatchListItemModel(title: "Paprika", type: "Anime movie", priority: 2),
      WatchListItemModel(
          title: "The Ancient Magus Bride", type: "Anime series", priority: 3, finished: true),
      WatchListItemModel(
          title: "Mashle Magic and Muscles: Beyond Magic and Stuff",
          type: "Anime series"),
      WatchListItemModel(title: "The Apothecary Diaries", type: "Anime series", priority: 3),
      WatchListItemModel(title: "Invincible Season 2", type: "Cartoon", priority: 3),
      WatchListItemModel(title: "Land of the Lustrous", type: "Anime series", priority: 2),
      WatchListItemModel(title: "House M.D", type: "Series", priority: 2),
      WatchListItemModel(title: "Euphoria", type: "Series"),
      WatchListItemModel(title: "Nimona", type: "Movie"),
      WatchListItemModel(title: "Avenger Infinity War", type: "Movie"),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return WatchListItem(
          title: listItems[index].title,
          type: listItems[index].type,
          priority: listItems[index].priority,
          finished: listItems[index].finished,
        );
      },
    );
  }
}
