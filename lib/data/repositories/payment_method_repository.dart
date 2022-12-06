// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:payment_method_module/utils.dart';

import 'package:payment_method_module/domain/entities/payment_method_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/payment_method_repository_interface.dart';
import '../datasources/payment_method_ds.dart';

class PaymentMethodRepository extends PaymentMethodRepositoryInterface {
  final PaymentMethodDataSource rds;
  PaymentMethodRepository({required this.rds});

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> listPaymentMethod() async {
    List<PaymentMethodEntity> paymentMethods = [];
    try {
      final result = await rds.listPaymentMethod();
      paymentMethods = result
          .map((e) => PaymentMethodEntity(
                paymentMethodImage: e.paymentMethodImage,
                paymentMethodName: e.paymentMethodName,
                bankOptions: e.bankOption,
              ))
          .toList();
    } on ServerException {
      return const Left(ServerFailure('Cannot call listPaymentMethod'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
    return Right(paymentMethods);
  }
}
