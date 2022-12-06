import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/payment_method_entity.dart';

abstract class PaymentMethodListState extends Equatable {
  const PaymentMethodListState();

  @override
  List<Object> get props => [];
}

class ListPaymentMethodLoading extends PaymentMethodListState {
  @override
  String toString() => 'Loading....';
}

class ListPaymentMethodInitial extends PaymentMethodListState {}

class MainListPaymentMethod extends PaymentMethodListState {
  final List<PaymentMethodEntity> paymentMethods;
  const MainListPaymentMethod({
    required this.paymentMethods,
  });

  MainListPaymentMethod copyWith({
    List<PaymentMethodEntity>? paymentMethods,
  }) {
    return MainListPaymentMethod(
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  @override
  List<Object> get props => [
        paymentMethods,
      ];
}
