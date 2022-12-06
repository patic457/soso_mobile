import 'package:payment_method_module/data/models/bank_option_model.dart';

class PaymentMethodModel {
  bool? paymentMethodStatus;
  String? sId;
  String? paymentMethodName;
  String? paymentMethodImage;
  String? paymentGateway;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? paymentMethodGroup;
  String? paymentMethod;
  List<BankOptionModel>? bankOption;

  PaymentMethodModel({
    this.paymentMethodStatus,
    this.sId,
    this.paymentMethodName,
    this.paymentMethodImage,
    this.paymentGateway,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.paymentMethodGroup,
    this.paymentMethod,
    this.bankOption,
  });

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    paymentMethodStatus = json['paymentMethodStatus'];
    sId = json['_id'];
    paymentMethodName = json['paymentMethodName'];
    paymentMethodImage = json['paymentMethodImage'];
    paymentGateway = json['paymentGateway'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
    paymentMethodGroup = json['paymentMethodGroup'];
    paymentMethod = json['paymentMethod'];
    if (json['bankOption'] != null) {
      bankOption = <BankOptionModel>[];
      json['bankOption'].forEach((v) {
        bankOption!.add(BankOptionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentMethodStatus'] = this.paymentMethodStatus;
    data['_id'] = this.sId;
    data['paymentMethodName'] = this.paymentMethodName;
    data['paymentMethodImage'] = this.paymentMethodImage;
    data['paymentGateway'] = this.paymentGateway;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    data['paymentMethodGroup'] = this.paymentMethodGroup;
    data['paymentMethod'] = this.paymentMethod;
    if (this.bankOption != null) {
      data['bankOption'] = this.bankOption!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
