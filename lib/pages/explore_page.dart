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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An Awesome Explore Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          Text(
            'Coming Soon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
