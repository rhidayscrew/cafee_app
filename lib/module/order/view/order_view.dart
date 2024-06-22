import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/form/searchfield/searchfieldcafee.dart';
import '../controller/order_controller.dart';
import '../state/order_state.dart';
import 'package:get_it/get_it.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  OrderController controller = OrderController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<OrderController>()) {
      GetIt.I.unregister<OrderController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<OrderController, OrderState>(
        listener: (context, state) {},
        child: BlocBuilder<OrderController, OrderState>(
          builder: (context, state) {
            final bloc = context.read<OrderController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    OrderController controller,
    OrderState state,
  ) {
    return Scaffold(
      key: Key(Random()
          .nextInt(1000)
          .toString()), // key : agar tidak ribet hot restart berkalixX, nanti dihapus ajah

      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchFieldCafee(
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
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
                        const SizedBox(
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
                          const SizedBox(
                            height: 8.0,
                          ),
                          CircleAvatar(
                            backgroundColor: index % 4 == 0
                                ? Color(0xff0563ff)
                                : successColor,
                            child: Icon(
                              index % 4 == 0
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
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
                                const SizedBox(
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
                              const SizedBox(
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
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
