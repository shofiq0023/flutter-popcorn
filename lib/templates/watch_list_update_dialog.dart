import 'package:flutter/material.dart';
import 'package:popcron/databases/watch_list_database.dart';
import 'package:popcron/global.dart';
import 'package:popcron/models/watch_list.dart';
import 'package:provider/provider.dart';

class WatchListUpdateDialog extends StatefulWidget {
  final WatchListModel watchListModel;

  const WatchListUpdateDialog({super.key, required this.watchListModel});

  @override
  State<WatchListUpdateDialog> createState() => _WatchListUpdateDialogState();
}

class _WatchListUpdateDialogState extends State<WatchListUpdateDialog> {
  late TextEditingController titleController;
  late String showType;
  late int showPriority;
  bool titleError = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.watchListModel.title);
    showType = widget.watchListModel.type;
    showPriority = widget.watchListModel.priority;
  }

  void updateWatchList() {
    final newWatchListItem = WatchListModel()
      ..id = widget.watchListModel.id
      ..title = titleController.text
      ..type = showType
      ..priority = showPriority;

    context.read<WatchListDatabase>().updateWatchList(newWatchListItem);
    titleController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            style: TextStyle(
              color: Colors.red.shade300,
            ),
          ),
        ),

        /// Update button
        MaterialButton(
          onPressed: () {
            if (titleController.text.isEmpty) {
              setState(() {
                titleError = true;
              });
            } else {
              updateWatchList();
            }
          },
          child: Text(
            "Update",
            style: TextStyle(color: Colors.green.shade300),
          ),
        ),
      ],
    );
  }
}
