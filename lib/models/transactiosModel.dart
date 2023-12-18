class TransactionModel {
  String receiveImg;
  String senderImg;
  String amountTransfer;
  String senderName;
  String receiverName;
  String id;
  int senderAccNo;
  int receiverAccNo;

  TransactionModel(
      {required this.receiveImg,
      required this.senderImg,
      required this.amountTransfer,
       required this.senderName,
      required this.receiverName,
      required this.senderAccNo,
      required this.receiverAccNo,
        required this.id});

  TransactionModel.fromjson(Map<String, dynamic> json)
      : this(
    receiveImg: json["receiveImg"],
    senderImg: json["senderImg"],
    amountTransfer: json["amountTransfer"],
    senderName: json["senderName"],
    receiverName: json["receiverName"],
    senderAccNo: json["senderAccNo"],
    receiverAccNo: json["receiverAccNo"],
    id: json["id"],
  );

  Map<String, dynamic> Tojson() {
    return {
      "receiveImg": receiveImg,
      "senderImg": senderImg,
      "amountTransfer": amountTransfer,
      "senderName": senderName,
      "receiverName":receiverName,
      "senderAccNo": senderAccNo,
      "receiverAccNo": receiverAccNo,
      "id":id
    };
  }
}