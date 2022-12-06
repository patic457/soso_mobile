import 'package:equatable/equatable.dart';

abstract class PaymentMethodListEvent extends Equatable {
  const PaymentMethodListEvent();
}

class ShowListViewEvent extends PaymentMethodListEvent {
  const ShowListViewEvent();

  @override
  List<Object?> get props => [];
}
