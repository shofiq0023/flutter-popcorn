import 'package:flutter/material.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/pages/explore_page.dart';
import 'package:popcorn/pages/home_page.dart';
import 'package:popcorn/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/explore': (context) => const ExplorePage(),
        '/profile':(context) => const ProfilePage(),
      },
    );
  }
}
