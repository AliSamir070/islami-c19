import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/strings_manager.dart';

class Tasbihat extends StatefulWidget {
  static const List<String> tasbihat = [
    StringsManager.tasbih1,
    StringsManager.tasbih2,
    StringsManager.tasbih3,
    StringsManager.tasbih4,
  ];
  final int index;
  final VoidCallback onTap;
  const Tasbihat({
    required this.index,
    required this.onTap,
  });

  @override
  State<Tasbihat> createState() => _TasbihatState();
}

class _TasbihatState extends State<Tasbihat> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Text(
        Tasbihat.tasbihat[widget.index],
        style: TextStyle(
          fontSize: 36,
          color: ColorsManager.whiteColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
