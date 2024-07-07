import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import '../controller/main_navigation_controller.dart';
import '../state/main_navigation_state.dart';
import 'package:get_it/get_it.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  MainNavigationController controller = MainNavigationController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<MainNavigationController>()) {
      GetIt.I.unregister<MainNavigationController>();
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
      child: BlocListener<MainNavigationController, MainNavigationState>(
        listener: (context, state) {},
        child: BlocBuilder<MainNavigationController, MainNavigationState>(
          builder: (context, state) {
            final bloc = context.read<MainNavigationController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    MainNavigationController controller,
    MainNavigationState state,
  ) {
    /*
    TODO: Implement this @ controller
    int selectedIndex = 0;

    updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    }
    */
    return DefaultTabController(
      length: 4,
      initialIndex: controller.state.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.state.selectedIndex,
          children: [DashboardView(), CartView(), OrderView(), ProfileView()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.state.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          selectedItemColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Me",
            ),
          ],
        ),
      ),
    );
  }
}
