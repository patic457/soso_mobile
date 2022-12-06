import 'package:equatable/equatable.dart';
import 'package:payment_method_module/data/models/bank_option_model.dart';

class PaymentMethodEntity extends Equatable {
  final String? paymentMethodName;
  final String? paymentMethodImage;
  final List<BankOptionModel?>? bankOptions;

  const PaymentMethodEntity({
    this.paymentMethodName,
    this.paymentMethodImage,
    this.bankOptions,
  });

  @override
  List<Object?> get props => [
        paymentMethodName,
        paymentMethodImage,
        bankOptions,
      ];

  PaymentMethodEntity copyWith({
    String? paymentMethodName,
    String? paymentMethodImage,
    List<BankOptionModel?>? bankOptions,
  }) {
    return PaymentMethodEntity(
      paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      paymentMethodImage: paymentMethodImage ?? this.paymentMethodImage,
      bankOptions: bankOptions ?? this.bankOptions,
    );
  }
}
