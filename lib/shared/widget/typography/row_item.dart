import 'package:flutter/material.dart';

// 07 membuat reusable widget
Widget RowItem({
  String? title,
  String? subtitle,
}) {
  return Padding(
    padding: EdgeInsets.all(6.0),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        Text(
          "$subtitle",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
