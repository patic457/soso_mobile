import 'package:bloc/bloc.dart';
import 'package:payment_method_module/presentation/bloc/payment_method_list_event.dart';
import 'package:payment_method_module/presentation/bloc/payment_method_list_state.dart';

import '../../domain/entities/payment_method_entity.dart';
import '../../domain/usecases/payment_method_uc.dart';

class PaymentMethodListBloc
    extends Bloc<PaymentMethodListEvent, PaymentMethodListState> {
  final PaymentMethodUseCase _getPaymentMethodUseCase;
  PaymentMethodListBloc(this._getPaymentMethodUseCase)
      : super(ListPaymentMethodInitial()) {
    on<PaymentMethodListEvent>(_onListPaymentMethodEvent);
  }

  void _onListPaymentMethodEvent(
      PaymentMethodListEvent event, Emitter<PaymentMethodListState> emit) async {
    final paymentMethods = await _getPaymentMethodUseCase.execute();
    emit(ListPaymentMethodLoading());
    final result = paymentMethods.fold((f) => f.message, (data) => data);
    if (result is String) {
      emit(ListPaymentMethodError(message: result));
      return;
    }
}


// class ListPaymentMethodBloc
//     extends Bloc<ListPaymentMethodEvent, ListPaymentMethodState> {
//   final GetPaymentMethodUseCase _getPaymentMethodUseCase;
//   ListPaymentMethodBloc(this._getPaymentMethodUseCase)
//       : super(ListPaymentMethodInitial()) {
//     on<GetPaymentMethodEvent>(_onListPaymentMethodEvent);
//   }

//   void _onListPaymentMethodEvent(
//       GetPaymentMethodEvent event, Emitter<ListPaymentMethodState> emit) async {
//     final paymentMethods = await _getPaymentMethodUseCase.execute();
//     emit(ListPaymentMethodLoading());
//     final result = paymentMethods.fold((f) => f.message, (data) => data);
//     if (result is String) {
//       emit(ListPaymentMethodError(message: result));
//       return;
//     }

//     emit(MainListPaymentMethod(
//         paymentMethods: result as List<PaymentMethodEntity>));
//   }
// }
