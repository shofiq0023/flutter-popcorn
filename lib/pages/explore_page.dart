import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'EXPLORE',
        style: TextStyle(color: Colors.white, fontSize: 62.0),
      ),
    );
  }
}
