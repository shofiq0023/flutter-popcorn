import 'package:flutter/material.dart';

import 'package:popcron/databases/watch_list_database.dart';
import 'package:popcron/global.dart';
import 'package:popcron/models/watch_list.dart';
import 'package:provider/provider.dart';

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
            textCapitalization: TextCapitalization.sentences,
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
          DropdownButton<String>(
            value: showType,
            isExpanded: true,
            hint: const Text(
              "Type of the show",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onChanged: (String? selectedShowType) {
              setState(() {
                showType = selectedShowType!;
              });
            },
            items: GlobalList.getShowType(),
          ),

          /// For spacing
          const SizedBox(
            height: 30.0,
          ),

          /// Dropdown for show priority
          DropdownButton<int>(
            value: showPriority,
            isExpanded: true,
            hint: const Text(
              "Priority of the show",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onChanged: (int? selectedPriority) {
              setState(() {
                showPriority = selectedPriority!;
              });
            },
            items: GlobalList.getPriorityList(),
          ),
        ],
      ),

      /// Action Buttons
      actions: [
        /// Cancel button
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: TextStyle(color: Colors.red.shade300),
          ),
        ),

        /// Create button
        MaterialButton(
          onPressed: () {
            if (titleController.text.isEmpty) {
              setState(() {
                titleError = true;
              });
            } else {
              final newWatchListItem = WatchListModel()
                ..title = titleController.text
                ..type = showType ?? GlobalList.showTypeList.first
                ..priority = showPriority ?? GlobalList.showPriorityList.first;

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
