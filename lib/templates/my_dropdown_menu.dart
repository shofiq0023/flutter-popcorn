import 'package:flutter/material.dart';

class MyDropdownMenu extends StatefulWidget {
  final String menuText;
  final List<String>? menuItems;
  final List<int>? priorityList;
  final Function(String showType)? onShowTypeValue;
  final Function(int showPriority)? onShowPriorityValue;

  const MyDropdownMenu({
    super.key,
    this.menuItems,
    required this.menuText,
    this.priorityList,
    this.onShowTypeValue,
    this.onShowPriorityValue,
  });

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  dynamic showTypeValue;
  dynamic showPriorityValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: showTypeValue,
      isExpanded: true,
      hint: Text(
        widget.menuText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onChanged: (dynamic selectedItem) {
        setState(() {
          if (isInt(selectedItem)) {
            showPriorityValue = selectedItem;
            widget.onShowPriorityValue!(selectedItem);
          } else {
            showTypeValue = selectedItem!;
            widget.onShowTypeValue!(selectedItem);
          }
        });
      },
      items: widget.menuItems == null ? getPriorityList() : getShowType(),
    );
  }

  List<DropdownMenuItem<String>>? getShowType() {
    return widget.menuItems?.map<DropdownMenuItem<String>>(
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

  List<DropdownMenuItem<int>>? getPriorityList() {
    return widget.priorityList?.map<DropdownMenuItem<int>>(
      (int value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            getPriorityText(value),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    ).toList();
  }

  String getPriorityText(int priorityLevel) {
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

  bool isInt(dynamic obj) => obj.runtimeType == int;
}
