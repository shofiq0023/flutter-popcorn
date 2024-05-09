import 'package:flutter/material.dart';
import 'package:popcron/databases/watch_list_database.dart';
import 'package:popcron/global.dart';
import 'package:popcron/models/watch_list.dart';
import 'package:popcron/templates/watch_list_update_dialog.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatefulWidget {
  final WatchListModel watchListModel;

  const WatchListItem({super.key, required this.watchListModel});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  // Delete
  void deleteWatchList(int id) {
    context.read<WatchListDatabase>().deleteWatchList(id);
  }

  // Update
  void showUpdateDialog(WatchListModel watchListModel) {
    showDialog(
      context: context,
      builder: (context) => WatchListUpdateDialog(
        watchListModel: watchListModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Main card container
    return GestureDetector(
      onTap: () {
        showUpdateDialog(widget.watchListModel);
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
                color: GlobalList.getPriorityColorForCard(widget.watchListModel.priority),
              ),

              // Padding between priority tag and titles
              const SizedBox(
                width: 12.0,
              ),

              // Title and delete button
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

                    // Delete button
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
  
}
