class WatchListItemModel {
  String title;
  String type;
  bool finished;
  int priority;

  WatchListItemModel({required this.title, required this.type, this.finished = false, this.priority = 4});
}