
class PaymentMethodModel {
  int? color;
  String CardNumber;
  String HolderName;
  String ExpireDate;
  int CVV;
  int? cardBalance;
  String id;

  PaymentMethodModel(
      {required this.CardNumber,
      required this.HolderName,
      required this.ExpireDate,
      required this.CVV,
      required this.id,
      this.color,
       this.cardBalance});

  PaymentMethodModel.fromjson(Map<String, dynamic> json)
      : this(
          CardNumber: json["CardNumber"],
          HolderName: json["HolderName"],
          ExpireDate: json["ExpireDate"],
          CVV: json["CVV"],
          id: json["id"],
          color: json["color"],
          cardBalance: json["cardBalance"],
        );

  Map<String, dynamic> Tojson() {
    return {
      "CardNumber": CardNumber,
      "HolderName": HolderName,
      "ExpireDate": ExpireDate,
      "CVV": CVV,
      "id": id,
      "color": color,
      "cardBalance": cardBalance
    };
  }
}
