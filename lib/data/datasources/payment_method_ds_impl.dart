import 'dart:convert';

import '../../utils.dart';
import '../models/payment_method_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class PaymentMethodDataSourceImpl {
  String paymentMethodUrl =
      'https://mfaf-dev.adldigitalservice.com/sgl/api/v1/payment-management/method';
  Map<String, String> paymentMethodRequiredHeaders = {
    "Origin": RequiredHeaders().origin(),
    "Ocp-Apim-Subscription-Key": RequiredHeaders().ocpApimSubscriptionKey(),
    "X-Sgl-Id":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InlvelRkc3pITTNWIiwiZmlyc3RuYW1lIjoiQXBwcm92ZXJzcyIsImxhc3RuYW1lIjoiVGVzdGVyIiwidXNlcm5hbWUiOiJzZ2x0ZXN0MTZAY29ycC5haXM5MDBkZXYub3JnIiwiYWNjb3VudENhdGVnb3J5IjoicmVzaWRlbnRpYWwiLCJpYWwiOiIxLjEiLCJyb2xlcyI6WyJjYXJ0LW1hbmFnZW1lbnQiLCJjYW5jZWwtb3JkZXIiLCJ2aWV3LXB1cmNoYXNlLW9yZGVyIiwicmVjZWl2ZS1vcmRlciIsInVwZGF0ZS1vcmRlciIsInZpZXctdGlja2V0IiwiY3JlYXRlLXRpY2tldCIsInVwZGF0ZS10aWNrZXQiLCJjYW5jZWwtdGlja2V0IiwiYmFjay1vZmZpY2UtYWRtaW4iLCJwcm9kdWN0LW1hbmFnZSIsInByb2R1Y3QtY3JlYXRvciIsInByb2R1Y3QtYWRtaW4iLCJwcm9kdWN0LW1vZGlmeSIsInByb2R1Y3QtZGVsZXRlIiwiaW52ZW50b3J5LWNyZWF0b3IiLCJpbnZlbnRvcnktbW9kaWZ5IiwiaW52ZW50b3J5LWRlbGV0ZSIsImludmVudG9yeS1hZG1pbiIsImludmVudG9yeS1zYWxlLXByaWNlIiwiaW52ZW50b3J5LWRlYWxlci1wcmljZSIsInJlc291cmNlLWNyZWF0b3IiLCJyZXNvdXJjZS1tb2RpZnkiLCJyZXNvdXJjZS1kZWxldGUiLCJyZXNvdXJjZS1hZG1pbiIsInByb2R1Y3QtZGVhbGVyLXByaWNlIiwicHJvZHVjdC1zYWxlLXByaWNlIiwicHJvZHVjdC1zcGVjaWFsLWdyb3VwIiwibWVyY2hhbnQtbWFuYWdlIiwibWVyY2hhbnQtYWRtaW4iLCJtZXJjaGFudC1jcmVhdG9yIiwibWVyY2hhbnQtbW9kaWZ5IiwibWVyY2hhbnQtZGVsZXRlIiwidmlldy1tZW1iZXItYWxsIiwidmlldy1vcmRlci1hbGwiLCJwdXJjaGFzZS1hcHByb3ZhbCIsInZpZXctcmVmdW5kLW9yZGVyIiwidXBkYXRlLXJlZnVuZCJdLCJ2ZXJzaW9uIjoiMS4yIiwiaWF0IjoxNjY1NDc4MTA3fQ.BMsuPw4OF_GDOMFvVL5bKxts2W0V1TRhLCvtbsrn2mU",
    "X-Transaction-id": RequiredHeaders().xTransactionId(12),
  };

  @override
  Future<List<PaymentMethodModel>> listPaymentMethod() async {
    List<PaymentMethodModel> paymentList = [];
    try {
      final response = await http.get(Uri.parse(paymentMethodUrl),
          headers: paymentMethodRequiredHeaders);
      if (response.statusCode != HttpStatus.ok) {
        final json = jsonDecode(response.body);
        final dynamic paymentListJson = json['results'] ?? [];
        paymentList = paymentListJson
            .map<PaymentMethodModel>((e) => PaymentMethodModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      throw ServerException();
    }
    return paymentList;
  }
}
