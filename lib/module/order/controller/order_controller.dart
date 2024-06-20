
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/order_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class OrderController extends Cubit<OrderState> implements IBlocBase {
  OrderController() : super(OrderState());

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
}
    
      
    