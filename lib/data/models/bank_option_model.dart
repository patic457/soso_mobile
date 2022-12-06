class BankOptionModel {
  String? bankCode;
  String? bankName;
  String? bankImage;

  BankOptionModel({this.bankCode, this.bankName, this.bankImage});

  BankOptionModel.fromJson(Map<String, dynamic> json) {
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    bankImage = json['bankImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankCode'] = this.bankCode;
    data['bankName'] = this.bankName;
    data['bankImage'] = this.bankImage;
    return data;
  }

  BankOptionModel copyWith({
    String? bankCode,
    String? bankName,
    String? bankImage,
  }) {
    return BankOptionModel(
      bankCode: bankCode ?? this.bankCode,
      bankName: bankName ?? this.bankName,
      bankImage: bankImage ?? this.bankImage,
    );
  }
}
