import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/global.dart';
import 'package:popcorn/templates/custom_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Main Home page
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      floatingActionButton: customFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const MyNavigationBar(),
    );
  }

  /// My appbar
  PreferredSize myAppBar() {
    const appTitle = 'POPCRON';
    const boldWeight = 700.0;
    const borderRadius = 15.0;
    const titleSize = 28.0;
    const appBarHeight = 65.0;
    const appBarElevation = 20.0;
    List<FontVariation> titleWight = const <FontVariation>[FontVariation('wght', boldWeight)];
    HexColor appBarBg = CustomColors.secondaryViolet;
    HexColor titleColor = CustomColors.offwhite;

    return PreferredSize(
      preferredSize: const Size.fromHeight(appBarHeight),
      child: AppBar(
        elevation: appBarElevation,
        centerTitle: true,
        backgroundColor: appBarBg,
        title: Text(
          appTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: titleSize,
            fontVariations: titleWight,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }

  /// Floating action button
  FloatingActionButton customFAB() {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: CustomColors.primaryVoilet,
      child: const Icon(
        Icons.add,
        size: 32.0,
      ),
    );
  }
}
