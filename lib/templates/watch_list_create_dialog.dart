import 'package:flutter/material.dart';
import 'package:popcorn/databases/watch_list_database.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:provider/provider.dart';

class WatchListCreateDialog extends StatefulWidget {
  const WatchListCreateDialog({super.key});

  @override
  State<WatchListCreateDialog> createState() => WatchListCreateDialogState();
}

class WatchListCreateDialogState extends State<WatchListCreateDialog> {
  final titleController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            final newWatchListItem = WatchListModel()
              ..title = titleController.text
              ..type = typeController.text
              ..isFinished = false
              ..priority = 1;
            context.read<WatchListDatabase>().createWatchList(newWatchListItem);
            titleController.clear();
            typeController.clear();
            Navigator.pop(context);
          },
          child: Text(
            "Create",
            style: TextStyle(color: Colors.green.shade300),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter the title",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: titleController,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter type",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextField(
                controller: typeController,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
