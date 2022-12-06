import 'dart:math';
import 'package:equatable/equatable.dart';

class RequiredHeaders {
  String xTransactionId(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  String origin() {
    return "https://mfaf-dev.adldigitalservice.com";
  }

  String ocpApimSubscriptionKey() {
    return "886d6c25db8b445992b23cc6fa669a3a";
  }
}

class ServerException implements Exception {}

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
