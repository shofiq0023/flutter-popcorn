import 'package:flutter/material.dart';
import 'package:popcorn/databases/watch_list_database.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/models/watch_list.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatefulWidget {
  final WatchListModel watchListModel;

  const WatchListItem({
    super.key,
    required this.watchListModel
  });

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  // Delete
  void deleteWatchList(int id) {
    context.read<WatchListDatabase>().deleteWatchList(id);
  }

  // Update
  void showUpdateDialog() {
    // showDialog(
    //   context: context,
    //   builder: (context) => const WatchListCreateDialog(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    // Main card container
    return GestureDetector(
      onTap: () {
        showUpdateDialog();
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: CustomColors.cardBg,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
      
        // Main card content
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Priority tag
              Container(
                width: 4.0,
                color: getPriorityColor(widget.watchListModel.priority),
              ),
      
              // Padding between priority tag and titles
              const SizedBox(
                width: 12.0,
              ),
      
              // Title and radio button
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.watchListModel.title,
                              style: TextStyle(
                                color: CustomColors.offwhite,
                                fontSize: 20.0,
                                fontVariations: const <FontVariation>[
                                  FontVariation('wght', 700.0)
                                ],
                              ),
                            ),
                            Text(
                              widget.watchListModel.type,
                              style: TextStyle(
                                color: CustomColors.offwhite,
                                fontSize: 10.0,
                                fontVariations: const <FontVariation>[
                                  FontVariation('wght', 100.0)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
      
                    // Placeholder radio button
                    IconButton(
                      onPressed: () {
                        deleteWatchList(widget.watchListModel.id);
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: CustomColors.primaryVoilet,
                        size: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
      
              // Ending padding
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Set the color of the Priority tag
  Color getPriorityColor(int priority) {
    if (priority == 1) {
      return CustomColors.priorityOne;
    } else if (priority == 2) {
      return CustomColors.priorityTwo;
    } else if (priority == 3) {
      return CustomColors.priorityThree;
    } else {
      return CustomColors.cardBg;
    }
  }
}
