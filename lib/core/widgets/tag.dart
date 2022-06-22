import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;

  const Tag({
    Key? key,
    required this.text,
    required this.color,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 19, left: 19, top: 11, bottom: 11),
      margin: EdgeInsets.only(right: 18, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1, style: BorderStyle.solid),
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}
