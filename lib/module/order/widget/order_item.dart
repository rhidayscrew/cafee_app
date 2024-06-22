// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class OrderItem extends StatelessWidget {
  final int index;
  final Map item;
  OrderItem({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index == 0)
          Text(
            "Today",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff426586),
            ),
          ),
        if (index == 0)
          SizedBox(
            height: 8.0,
          ),
        Row(
          children: [
            Container(
              width: 50,
              child: Text(
                "10:10",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            CircleAvatar(
              backgroundColor:
                  index % 4 == 0 ? Color(0xff0563ff) : successColor,
              child: Icon(
                index % 4 == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#1101",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff426586),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Sales",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff426586),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${NumberFormat().format(Random().nextInt(200000))}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff426586),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "Item",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff426586),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
