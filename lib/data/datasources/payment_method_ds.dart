import '../models/payment_method_model.dart';

abstract class PaymentMethodDataSource {
  Future<List<PaymentMethodModel>> listPaymentMethod();
}
