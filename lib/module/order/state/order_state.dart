import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_state.freezed.dart';

@unfreezed
class OrderState with _$OrderState {
  factory OrderState({
    @Default(0) int counter,
    @Default([
      {
        "id": 1001,
        "date": "2024-06-23 10:25",
        "type": "Sales",
        "total": 250.000,
        "item_count": 5,
      },
      {
        "id": 1002,
        "date": "2024-06-23 11:30",
        "type": "Purchase",
        "total": 300.000,
      },
      {
        "id": 1003,
        "date": "2024-06-22 09:20",
        "type": "Sales",
        "total": 150.000,
        "item_count": 3,
      },
      {
        "id": 1004,
        "date": "2024-06-22 08:45",
        "type": "Sales",
        "total": 450.000,
        "item_count": 10,
      },
      {
        "id": 1005,
        "date": "2023-06-26 14:15",
        "type": "Purchase",
        "total": 500.000,
      },
      {
        "id": 1006,
        "date": "2023-06-26 16:00",
        "type": "Sales",
        "total": 100.000,
        "item_count": 2,
      },
      {
        "id": 1007,
        "date": "2023-11-29 10:10",
        "type": "Purchase",
        "total": 350.000,
        "item_count": 8,
      },
      {
        "id": 1008,
        "date": "2023-11-30 12:25",
        "type": "Sales",
        "total": 400.000,
        "item_count": 9,
      },
      {
        "id": 1009,
        "date": "2023-12-01 11:55",
        "type": "Sales",
        "total": 200.000,
        "item_count": 4,
      },
      {
        "id": 1010,
        "date": "2023-12-02 14:35",
        "type": "Purchase",
        "total": 600.000,
        "item_count": 15,
      },
      {
        "id": 1011,
        "date": "2023-12-03 09:45",
        "type": "Sales",
        "total": 700.000,
        "item_count": 16,
      },
      {
        "id": 1012,
        "date": "2023-12-04 13:20",
        "type": "Sales",
        "total": 150.000,
        "item_count": 3,
      },
      {
        "id": 1013,
        "date": "2023-12-05 15:10",
        "type": "Purchase",
        "total": 250.000,
        "item_count": 6,
      },
      {
        "id": 1014,
        "date": "2023-12-06 16:45",
        "type": "Sales",
        "total": 550.000,
        "item_count": 13,
      },
      {
        "id": 1015,
        "date": "2023-12-07 08:30",
        "type": "Sales",
        "total": 450.000,
        "item_count": 10,
      },
      {
        "id": 1016,
        "date": "2023-12-08 10:50",
        "type": "Purchase",
        "total": 300.000,
        "item_count": 7,
      },
      {
        "id": 1017,
        "date": "2023-12-09 14:00",
        "type": "Sales",
        "total": 650.000,
        "item_count": 14,
      },
      {
        "id": 1018,
        "date": "2023-12-10 12:15",
        "type": "Purchase",
        "total": 400.000,
        "item_count": 9,
      },
      {
        "id": 1019,
        "date": "2023-12-11 15:40",
        "type": "Sales",
        "total": 200.000,
        "item_count": 5,
      },
      {
        "id": 1020,
        "date": "2023-12-12 09:25",
        "type": "Sales",
        "total": 800.000,
        "item_count": 17,
      },
    ])
    List items,
  }) = _OrderState;
}
