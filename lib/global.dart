import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomColors {
  static final HexColor primaryVoilet = HexColor("#A177FF");
  static final HexColor secondaryViolet = HexColor("#1D193A");
  static final HexColor bgVoilet = HexColor("#111129");
  static final HexColor cardBg = HexColor("#1C1C44");
  static final HexColor offwhite = HexColor("#F0F0F0");
  static final HexColor priorityOne = HexColor("#9C89FF");
  static final HexColor priorityTwo = HexColor("#7E38B7");
  static final HexColor priorityThree = HexColor("#541675");
}

class GlobalList {
  static List<String> showTypeList = [
    'Movie',
    'Series',
    'Anime series',
    'Anime movie'
  ];

  static List<int> showPriorityList = [4, 1, 2, 3];

  /// Get the Dropdown items for the Type of the show
  static List<DropdownMenuItem<String>>? getShowType() {
    return GlobalList.showTypeList.map<DropdownMenuItem<String>>(
      (String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    ).toList();
  }

  /// Get the Dropdown items for Show priority list
  static List<DropdownMenuItem<int>>? getPriorityList() {
    return GlobalList.showPriorityList.map<DropdownMenuItem<int>>(
      (int value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              Icon(
                Icons.remove_red_eye,
                color: getPriorityColor(value),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
              ),
              Text(
                getPriorityText(value),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    ).toList();
  }

  /// Get the text based on the priority level
  static String getPriorityText(int priorityLevel) {
    switch (priorityLevel) {
      case 1:
        return "High";
      case 2:
        return "Medium";
      case 3:
        return "Low";
      default:
        return "Normal";
    }
  }

  /// Get color of the priority based on priority level
  static HexColor getPriorityColor(int priorityLevel) {
    switch (priorityLevel) {
      case 1:
        return CustomColors.priorityOne;
      case 2:
        return CustomColors.priorityTwo;
      case 3:
        return CustomColors.priorityThree;
      default:
        return CustomColors.offwhite;
    }
  }

  /// Set the color of the Priority tag
  static Color getPriorityColorForCard(int priority) {
    if (priority == 1) {
      return CustomColors.priorityOne;
    } else if (priority == 2) {
      return CustomColors.priorityTwo;
    } else if (priority == 3) {
      return CustomColors.priorityThree;
    } else {
      return CustomColors.cardBg;
    }
  }
}
