import 'package:popcron/models/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class WatchListDatabase extends ChangeNotifier {
  static late Isar isar;

  // List of data
  List<WatchListModel> watchLists = [];

  // Initialize
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [WatchListModelSchema],
      directory: dir.path,
    );
  }

  // Create
  Future<void> createWatchList(WatchListModel model) async {
    final newWatchListItem = WatchListModel()
      ..title = model.title
      ..type = model.type
      ..priority = model.priority;

    await isar.writeTxn(() => isar.watchListModels.put(newWatchListItem));
    fetchWatchList();
  }

  // Read
  Future<void> fetchWatchList() async {
    List<WatchListModel> lists = await isar.watchListModels.where().findAll();
    watchLists.clear();
    watchLists.addAll(lists);
    watchLists.sort(
      (a, b) => a.priority.compareTo(b.priority),
    );

    notifyListeners();
  }

  // Update
  Future<void> updateWatchList(WatchListModel model) async {
    final existingModel = await isar.watchListModels.get(model.id);

    if (existingModel != null) {
      existingModel.title = model.title;
      existingModel.type = model.type;
      existingModel.priority = model.priority;

      await isar.writeTxn(() => isar.watchListModels.put(existingModel));
      await fetchWatchList();
    }
  }

  // Delete
  Future<void> deleteWatchList(int id) async {
    await isar.writeTxn(() => isar.watchListModels.delete(id));
    await fetchWatchList();
  }
}
