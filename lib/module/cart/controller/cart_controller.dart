import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/cart_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartController extends Cubit<CartState> implements IBlocBase {
  CartController() : super(CartState());

  @override
  void initState() {
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

  updateVisiblity() {
    state.visible = !state.visible;
    emit(state.copyWith());
  }
}
