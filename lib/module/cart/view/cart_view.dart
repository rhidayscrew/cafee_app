import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/typography/row_item.dart';
import '../controller/cart_controller.dart';
import '../state/cart_state.dart';
import 'package:get_it/get_it.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = CartController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<CartController>()) {
      GetIt.I.unregister<CartController>();
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
      child: BlocListener<CartController, CartState>(
        listener: (context, state) {},
        child: BlocBuilder<CartController, CartState>(
          builder: (context, state) {
            final bloc = context.read<CartController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    CartController controller,
    CartState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              size: 24.0,
            ),
          ),
        ],
      ),
      // 02 add list_builder
      // 03 setlah return ketik card_cart3 (dihapus dulu sebelum nya)
      // 04 masukan Stack
      body: Stack(
        // key: Key(Random()
        //     .nextInt(1000)
        //     .toString()), // key : agar tidak ribet hot restart berkalixX, nanti dihapus ajah
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(20.0),
            itemCount: state.items.length,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = state.items[index];
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            item["photo"],
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["product_name"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            item["category"],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "\$.00",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[600],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .moveX(
                    begin: index % 2 == 0 ? 100 : 100,
                    duration: ((index * 300) + 300).ms,
                  )
                  .fadeIn(
                    duration: ((index * 300) + 300).ms,
                  );
            },
          ),
          if (state.visible == true)
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () => controller.updateVisiblity(),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 24,
                        offset: Offset(0, 11),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[300]!,
                    ),
                  ),
                  // 05 add child and col+Tab
                  // RowItem memakan reusable widget cek di shared - widget dll
                  child: Column(
                    children: [
                      H6(
                        title: "Payment Summary",
                      ),
                      RowItem(
                        title: "Sub Total",
                        subtitle: "\$100.25",
                      ),
                      RowItem(
                        title: "Discount",
                        subtitle: "\$10",
                      ),
                      RowItem(
                        title: "Total",
                        subtitle: "\$90.25",
                      ),
                      Divider(),
                      QButton(
                        label: "Checkout",
                        onPressed: () {},
                      )
                    ],
                  ),
                )
                    .animate()
                    .moveY(
                      begin: 200,
                      duration: 1000.ms,
                    )
                    .fadeIn(
                      duration: 1000.ms,
                    ),
              ),
            ),
          if (state.visible == false)
            Positioned(
              right: 20,
              bottom: 40,
              child: GestureDetector(
                onTap: () => controller.updateVisiblity(),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .moveY(
                      begin: 100,
                      duration: 2000.ms,
                    )
                    .fadeIn(
                      duration: 1000.ms,
                    ),
              ),
            )
        ],
      ),
    );
  }
}
