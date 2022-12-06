import 'package:payment_method_module/domain/repositories/payment_method_repository_interface.dart';
import 'package:dartz/dartz.dart';
import '../../utils.dart';
import '../entities/payment_method_entity.dart';

class PaymentMethodUseCase {
  final PaymentMethodRepositoryInterface repositoryInterface;
  PaymentMethodUseCase({
    required this.repositoryInterface,
  });

  Future<Either<Failure, List<PaymentMethodEntity>>> execute() {
    return repositoryInterface.listPaymentMethod();
  }
}
