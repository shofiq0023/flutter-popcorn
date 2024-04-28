import 'package:flutter/material.dart';
import 'package:popcorn/databases/watch_list_database.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:popcorn/templates/my_dropdown_menu.dart';
import 'package:provider/provider.dart';

final List<String> showTypeList = [
  'Movie',
  'Series',
  'Anime series',
  'Anime movie'
];

final List<int> showPriorityList = [4, 1, 2, 3];

class WatchListCreateDialog extends StatefulWidget {
  const WatchListCreateDialog({super.key});

  @override
  State<WatchListCreateDialog> createState() => WatchListCreateDialogState();
}

class WatchListCreateDialogState extends State<WatchListCreateDialog> {
  final titleController = TextEditingController();
  String? showType;
  int? showPriority;
  bool titleError = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      /// Dropdown menues
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// For the title of the show
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              error: titleError
                  ? const Text(
                      "Please enter a title!",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : null,
              label: Text(
                "Title of the show",
                style: TextStyle(
                  color: CustomColors.offwhite,
                  fontSize: 16.0,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  titleError = false;
                });
              }
            },
            style: const TextStyle(
              color: Colors.white,
            ),
          ),

          /// For spacing
          const SizedBox(
            height: 30.0,
          ),

          /// Dropdown for Type of the show
          MyDropdownMenu(
            menuText: "Type of the show",
            menuItems: showTypeList,
            onShowTypeValue: (showTypeValue) {
              showType = showTypeValue;
            },
          ),

          /// For spacing
          const SizedBox(
            height: 30.0,
          ),

          /// Dropdown for show priority
          MyDropdownMenu(
            menuText: "Priority of the show",
            priorityList: showPriorityList,
            onShowPriorityValue: (showPriorityValue) {
              showPriority = showPriorityValue;
            },
          ),
        ],
      ),

      /// Action Buttons
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red.shade300),
          ),
        ),
        MaterialButton(
          onPressed: () {
            if (titleController.text.isEmpty) {
              setState(() {
                titleError = true;
              });
            } else {
              final newWatchListItem = WatchListModel()
                ..title = titleController.text
                ..type = showType ?? showTypeList.first
                ..priority = showPriority ?? showPriorityList.first;

              print(newWatchListItem.toString());

              context
                  .read<WatchListDatabase>()
                  .createWatchList(newWatchListItem);
              titleController.clear();
              Navigator.pop(context);
            }
          },
          child: Text(
            "Create",
            style: TextStyle(color: Colors.green.shade300),
          ),
        ),
      ],
    );
  }
}
