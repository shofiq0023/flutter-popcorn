import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Beautiful Profile Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          Text(
            "Coming Soon",
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
