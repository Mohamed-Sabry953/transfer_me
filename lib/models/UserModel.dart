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

  UserModel(
      {required this.accountNo,
      this.id = '',
      required this.Email,
      this.firstname,
      this.lastname,
      this.profileImage,
      this.phoneNo,
      this.pin,
        this.secondLog=false});

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
            accountNo: json["accountNo"], Email: json["Email"],
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      profileImage: json["profileImage"],
      phoneNo: json["phoneNo"],
      pin: json["pin"],
      secondLog: json["secondLog"]

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
    };
  }
}
