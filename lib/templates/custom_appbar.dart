import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/global.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  MyAppbar({super.key});
  final appBarHeight = 65.0;
  final appTitle = 'POPCRON';
  final borderRadius = 15.0;
  final titleSize = 28.0;
  final appBarElevation = 8.0;
  final Color shadowColor = const Color.fromRGBO(0, 0, 0, 0.5);
  final List<FontVariation> titleWight = const <FontVariation>[FontVariation('wght', 700.0)];
  final HexColor appBarBg = CustomColors.secondaryViolet;
  final HexColor titleColor = CustomColors.offwhite;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        elevation: appBarElevation,
        centerTitle: true,
        backgroundColor: appBarBg,
        shadowColor: shadowColor,
        title: Text(
          appTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: titleSize,
            fontVariations: titleWight,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
