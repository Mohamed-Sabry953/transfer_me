class UserModel {
  String id;
  String? Email;
  int accountNo;
  String? firstname;
  String? lastname;
  int? phoneNo;
  String? profileImage;
  String? pin;
  bool secondLog;
  String deviceToken;
  String accState;

  UserModel(
      {required this.accountNo,
      this.id = '',
      required this.Email,
      this.firstname,
      this.lastname,
      this.profileImage,
      this.phoneNo,
      this.pin,
        this.secondLog=false,
        this.deviceToken='',
        this.accState="active"
      });

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
            accountNo: json["accountNo"], Email: json["Email"],
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      profileImage: json["profileImage"],
      phoneNo: json["phoneNo"],
      pin: json["pin"],
      secondLog: json["secondLog"],
    deviceToken: json["deviceToken"],
    accState: json["accState"],
  );

  Map<String, dynamic> Tojson() {
    return {
      "accountNo": accountNo,
      "id": id,
      "Email": Email,
      "firstname": firstname,
      "lastname": lastname,
      "profileImage": profileImage,
      "phoneNo": phoneNo,
      "pin": pin,
      "secondLog": secondLog,
      "deviceToken": deviceToken,
      "accState": accState,
    };
  }
}
