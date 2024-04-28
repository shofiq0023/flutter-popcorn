import 'package:flutter/material.dart';
import 'package:popcorn/global.dart';

class WatchListItem extends StatefulWidget {
  final String title;
  final String type;
  final int priority;

  const WatchListItem({
    super.key,
    required this.title,
    required this.type,
    required this.priority,
  });

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    // Main card container
    return Container(
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
              color: getPriorityColor(widget.priority),
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
                            widget.title,
                            style: TextStyle(
                              color: CustomColors.offwhite,
                              fontSize: 20.0,
                              fontVariations: const <FontVariation>[
                                FontVariation('wght', 700.0)
                              ],
                            ),
                          ),
                          Text(
                            widget.type,
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
                      
                    },
                    icon: Icon(
                      Icons.playlist_remove,
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
