import 'package:flutter/material.dart';
import 'package:popcron/databases/watch_list_database.dart';
import 'package:popcron/global.dart';
import 'package:popcron/pages/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WatchListDatabase.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchListDatabase(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popcron',
      theme: ThemeData(
        fontFamily: 'RobotoFlex',
        colorScheme: ColorScheme.fromSeed(
            seedColor: CustomColors.primaryVoilet,
            background: CustomColors.bgVoilet),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
