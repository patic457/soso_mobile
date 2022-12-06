import 'package:dartz/dartz.dart';
import '../../utils.dart';
import '../entities/payment_method_entity.dart';

abstract class PaymentMethodRepositoryInterface {
  Future<Either<Failure, List<PaymentMethodEntity>>> listPaymentMethod();
}
