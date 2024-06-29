import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_banner.dart';
import 'package:hyper_ui/shared/widget/form/searchfield/searchfieldcafee.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dashboard_controller.dart';
import '../state/dashboard_state.dart';
import 'package:get_it/get_it.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = DashboardController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<DashboardController>()) {
      GetIt.I.unregister<DashboardController>();
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
      child: BlocListener<DashboardController, DashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<DashboardController, DashboardState>(
          builder: (context, state) {
            final bloc = context.read<DashboardController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DashboardController controller,
    DashboardState state,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // key: Key(Random()
        //     .nextInt(1000)
        //     .toString()), // key : agar tidak ribet hot restart berkalixX, nanti dihapus ajah
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 320.0,
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff141414),
                          Color(0xff303030),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Bogor Indonesia",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            MdiIcons.chevronDown,
                                            size: 18.0,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044979/nr7gt66alfhmu9vaxu2u.png",
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
                              ],
                            )
                                .animate()
                                .moveY(
                                  duration: 800.ms,
                                )
                                .fadeIn(
                                  duration: 800.ms,
                                ),
                            SizedBox(
                              height: 15.0,
                            ),
                            SearchFieldCafee(
                              hintText: "Cari",
                              onChanged: (valu) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 170,
                    child: Dashboardbanner()
                        .animate()
                        .shake(
                          duration: 800.ms,
                        )
                        .fadeIn(
                          duration: 800.ms,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Memakai reusable widget yg ada di : lib-widget-category_picker :q_category_picker
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  QCategoryPicker(
                    key: Key(Random().nextInt(1000).toString()),
                    items: [
                      {
                        "label": "Main Course",
                        "value": "Main Course",
                      },
                      {
                        "label": "Drink",
                        "value": "Drink",
                      },
                      {
                        "label": "Snack",
                        "value": "Snack",
                      },
                      {
                        "label": "Dessert",
                        "value": "Dessert",
                      },
                      {
                        "label": "Main Course",
                        "value": "Main Course",
                      },
                      {
                        "label": "Drink",
                        "value": "Drink",
                      },
                      {
                        "label": "Snack",
                        "value": "Snack",
                      },
                      {
                        "label": "Dessert",
                        "value": "Dessert",
                      }
                    ],
                    validator: Validator.required,
                    onChanged: (index, label, value, item) {},
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

// responsive
// adaptive
// gridView dikasih builder, lalu ditambahkan LayoutBuilder, constraint
                  LayoutBuilder(builder: (context, constraint) {
                    // OPSI 1
                    // bool isTablet = MediaQuery.of(context).size.width < 1100 &&
                    //     MediaQuery.of(context).size.width >= 850;
                    // bool isDesktop = MediaQuery.of(context).size.width >= 1100;
                    // bool isMobile = MediaQuery.of(context).size.width < 850;

                    // int crossAxisCount = 2;

                    // if (isTablet) {
                    //   crossAxisCount = 4;
                    // } else if (isDesktop) {
                    //   crossAxisCount = 6;
                    // }

                    //OPSI 2
                    int crossAxisCount =
                        (MediaQuery.of(context).size.width / 200).floor();
                    ////

                    return GridView.builder(
                      // padding: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0 / 1.6,
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.products[index];
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(item["photo"] ??
                                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["product_name"],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      item["category"],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff9a9a9a),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "\$${item["price"]}",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 32,
                                          width: 32,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor,
                                              padding: EdgeInsets.all(0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 24.0,
                                              color: Colors.white,
                                            ),
                                          ),
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
                            .moveY(
                              begin: index % 2 == 0 ? -100 : 100,
                              duration: ((index * 300) + 800).ms,
                            )
                            .fadeIn(
                              duration: ((index * 300) + 800).ms,
                            );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
