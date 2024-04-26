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
      child: Text(
        'PROFILE Comming soon',
        style: TextStyle(
          color: Colors.white,
          fontSize: 62.0,
        ),
      ),
    );
  }
}
