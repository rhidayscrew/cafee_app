import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:hyper_ui/shared/util/db_service/db_servicee.dart';
=======
import 'package:hyper_ui/service/db_service/db_servicee.dart';
>>>>>>> 7b7ddd0 (01_login_not_work_sharedPreferences)
import '../state/login_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

  @override
  void initState() {
<<<<<<< HEAD
    state.email = DBServicee.get("email");
    state.email = DBServicee.get("password");
=======
    state.email = DBService.get("email");
>>>>>>> 7b7ddd0 (01_login_not_work_sharedPreferences)
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  increment() {
    state.counter++;
    emit(state.copyWith());
  }

  // 4 add methodt login
  login() async {}
}
