import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/databases/watch_list_database.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:provider/provider.dart';

// final List<String> showTypeList = [
//   'Movie',
//   'Series',
//   'Anime series',
//   'Anime movie'
// ];

// final List<int> showPriorityList = [4, 1, 2, 3];

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
            items: getShowType(),
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
            items: getPriorityList(),
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
            "Cancel",
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

  /// Get the Dropdown items for the Type of the show
  List<DropdownMenuItem<String>>? getShowType() {
    return GlobalList.showTypeList.map<DropdownMenuItem<String>>(
      (String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    ).toList();
  }

  /// Get the Dropdown items for Show priority list
  List<DropdownMenuItem<int>>? getPriorityList() {
    return GlobalList.showPriorityList.map<DropdownMenuItem<int>>(
      (int value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye,
                color: getPriorityColor(value),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              Text(
                getPriorityText(value),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    ).toList();
  }

  /// Get the text based on the priority level
  String getPriorityText(int priorityLevel) {
    switch (priorityLevel) {
      case 1:
        return "High";
      case 2:
        return "Medium";
      case 3:
        return "Low";
      default:
        return "Normal";
    }
  }

  /// Get color of the priority based on priority level
  HexColor getPriorityColor(int priorityLevel) {
    switch (priorityLevel) {
      case 1:
        return CustomColors.priorityOne;
      case 2:
        return CustomColors.priorityTwo;
      case 3:
        return CustomColors.priorityThree;
      default:
        return CustomColors.offwhite;
    }
  }
}
