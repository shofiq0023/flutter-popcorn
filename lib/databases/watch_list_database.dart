import 'package:popcron/models/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class WatchListDatabase extends ChangeNotifier {
  static late Isar isar;
  String titleToFilterWith = "";

  /// List of data
  List<WatchListModel> watchList = [];

  /// Initialize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [WatchListModelSchema],
      directory: dir.path,
    );
  }

  /// Add a new item to database
  Future<void> addWatchListItem(WatchListModel model) async {
    final newWatchListItem = WatchListModel()
      ..title = model.title
      ..type = model.type
      ..priority = model.priority;

    await isar.writeTxn(() => isar.watchListModels.put(newWatchListItem));
    fetchWatchList();
  }

  /// Get the full Watch list 
  Future<void> getTheFullList() async {
    List<WatchListModel> lists = await isar.watchListModels.where().findAll();
    watchList.clear();
    watchList.addAll(lists);
    watchList.sort(
      (a, b) => a.priority.compareTo(b.priority),
    );
  }

  /// Fetch watch list from database
  Future<void> fetchWatchList() async {
    await getTheFullList();
    notifyListeners();
  }

  /// Update a watch list item
  Future<void> updateWatchListItem(WatchListModel model) async {
    final existingModel = await isar.watchListModels.get(model.id);

    if (existingModel != null) {
      existingModel.title = model.title;
      existingModel.type = model.type;
      existingModel.priority = model.priority;

      await isar.writeTxn(() => isar.watchListModels.put(existingModel));
      await fetchWatchList();
    }
  }

  /// Delete watch list item
  Future<void> deleteWatchListItem(int id) async {
    await isar.writeTxn(() => isar.watchListModels.delete(id));

    if (getFilteringTitle().isNotEmpty) {
      await fetchWatchList();
      await filterList(getFilteringTitle());
    } else {
      await fetchWatchList();
    }
  }

  /// Filter the watch list
  Future<void> filterList(String title) async {
    // First create an empty list
    List<WatchListModel> filteredList = [];

    // Get the full list from DB
    await getTheFullList();

    // Set the value of the filtering title 
    setFilteringTitle(title);

    // Filter the DB list and store it in the empty list
    filteredList = watchList
        .where((i) =>
            i.title.toLowerCase().contains(getFilteringTitle().toLowerCase()))
        .toList();

    // Set the actual DB list to the filtered list
    watchList = filteredList;
    
    notifyListeners();
  }

  /// Clear filter data
  Future<void> clearFilter() async {
    setFilteringTitle("");
    fetchWatchList();
  }

  /// Set the value of the filtering title
  void setFilteringTitle(String title) {
    titleToFilterWith = title;
  }

  /// Get the value of the filtering title
  String getFilteringTitle() {
    return titleToFilterWith;
  }
}
