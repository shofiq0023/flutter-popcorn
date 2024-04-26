import 'package:flutter/material.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'WATCH LIST',
        style: TextStyle(
          color: Colors.white,
          fontSize: 62.0,
        ),
      ),
    );
  }
}
