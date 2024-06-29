import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/shared/util/db_service/db_servicee.dart';
import 'package:hyper_ui/shared/util/validator/validator.dart';
import 'package:hyper_ui/shared/widget/form/button/button.dart';
import 'package:hyper_ui/shared/widget/form/textfield/text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/login_controller.dart';
import '../state/login_state.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  //1 add fomrkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (GetIt.I.isRegistered<LoginController>()) {
      GetIt.I.unregister<LoginController>();
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
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {},
        child: BlocBuilder<LoginController, LoginState>(
          builder: (context, state) {
            final bloc = context.read<LoginController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    LoginController controller,
    LoginState state,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            //2 tambahkan form dan key: formKey,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        transform: Matrix4.translationValues(0.0, 10, 0),
                        child: Icon(
                          MdiIcons.cashRegister,
                          size: 64.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Pos",
                        style: GoogleFonts.blackOpsOne(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0.0, -10, 0),
                        child: Text(
                          "Restaurant",
                          style: GoogleFonts.blackOpsOne(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .moveY(
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    ),
                SizedBox(
                  height: 20.0,
                ),
                QTextField(
                  label: "Email",
                  validator: Validator.email,
                  suffixIcon: Icons.email,
                  value: controller.state.email,
                  onChanged: (value) {
                    controller.state.email = value; //7 add ini

                    DBServicee.set("email", value);
                  },
                )
                    .animate()
                    .moveX(
                      begin: 100,
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    ),
                QTextField(
                  label: "Password",
                  obscure: true,
                  validator: Validator.required,
                  suffixIcon: Icons.password,
                  value: null,
                  onChanged: (value) {
                    controller.state.password = value; //7 add ini

                    DBServicee.set("password", value);
                  },
                )
                    .animate()
                    .moveX(
                      begin: 100,
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    ),
                QButton(
                  label: "Login",
                  onPressed: () {
                    //3 add form validate
                    bool isNotValid = formKey.currentState!.validate() == false;
                    if (isNotValid) {
                      return;
                    }
                    controller.login(); // 5 panggil method login
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
