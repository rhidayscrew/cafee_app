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
    DateTime date = DateTime.parse(item["date"]);
    String dMMMy = DateFormat("d MMM y").format(date);
    String time = DateFormat("kk:mm").format(date);

    bool isPurchase = item["type"] == "Purchase";

    Color color = successColor;
    if (isPurchase) {
      color = dangerColor;
    }

    IconData icon = Icons.arrow_circle_right_outlined;
    if (isPurchase) {
      icon = Icons.arrow_circle_left_outlined;
    }
    String nowf = DateFormat("dd-MM-yyy").format(DateTime.now());
    String datef = DateFormat("dd-MM-yyy").format(date);
    bool isToday = datef == nowf;

    String nowf2 = DateFormat("dd-MM-yyy")
        .format(DateTime.now().subtract(Duration(days: 1)));
    String datef2 = DateFormat("dd-MM-yyy").format(date);
    bool isYesterday = datef2 == nowf2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isToday)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff426586),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        if (isYesterday)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff426586),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        if (!isToday && !isYesterday)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$dMMMy",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff426586),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        Row(
          children: [
            Container(
              width: 50,
              child: Text(
                "$time",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            CircleAvatar(
              backgroundColor: color,
              child: Icon(
                icon,
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
                    "#${item["id"]}",
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
                    "${item["type"]}",
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
                  "${NumberFormat().format(item["total"])}",
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
                  item["item_count"] != null
                      ? "${item["item_count"]} Items"
                      : "--",
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
