import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/order/widget/order_item.dart';
import 'package:hyper_ui/shared/widget/form/searchfield/searchfieldcafee.dart';
import '../controller/order_controller.dart';
import '../state/order_state.dart';
import 'package:get_it/get_it.dart';

class OrderView extends StatefulWidget {
  OrderView({Key? key}) : super(key: key);

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
        title: Text('Order'),
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
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.items.length,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map item = state.items[index];
                  return OrderItem(
                    index: index,
                    item: item,
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
