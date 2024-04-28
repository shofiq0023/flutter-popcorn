import 'package:isar/isar.dart';

part 'watch_list.g.dart';

@collection
class WatchListModel {
  Id id = Isar.autoIncrement;
  late String title;
  late String type;
  late bool isFinished;
  late int priority;

  @override
  String toString() {
    return 'id: $id, title: $title, type: $type, priority: $priority';
  }
}