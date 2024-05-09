import 'package:popcron/models/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class WatchListDatabase extends ChangeNotifier {
  static late Isar isar;
  String titleToFilterWith = "";

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

  Future<void> getTheFullList() async {
    List<WatchListModel> lists = await isar.watchListModels.where().findAll();
    watchLists.clear();
    watchLists.addAll(lists);
    watchLists.sort(
      (a, b) => a.priority.compareTo(b.priority),
    );
  }

  // Read
  Future<void> fetchWatchList() async {
    await getTheFullList();
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

    if (getFilteringTitle().isNotEmpty) {
      await fetchWatchList();
      await filterList(getFilteringTitle());
    } else {
      await fetchWatchList();
    }
  }

  Future<void> filterList(String title) async {
    // First create an empty list
    List<WatchListModel> filteredList = [];

    // Get the full list from DB
    await getTheFullList();

    // Set the value of the filtering title 
    setFilteringTitle(title);

    // Filter the DB list and store it in the empty list
    filteredList = watchLists
        .where((i) =>
            i.title.toLowerCase().contains(getFilteringTitle().toLowerCase()))
        .toList();

    // Set the actual DB list to the filtered list
    watchLists = filteredList;
    
    notifyListeners();
  }

  Future<void> clearFilter() async {
    setFilteringTitle("");
    fetchWatchList();
  }

  void setFilteringTitle(String title) {
    titleToFilterWith = title;
  }

  String getFilteringTitle() {
    return titleToFilterWith;
  }
}
