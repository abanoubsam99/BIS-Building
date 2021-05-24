class LoginModel {
  String data;
  List<Null> errors;
  bool result;
  String userID;
  Null userImageURL;
  String userName;

  LoginModel(
      {this.data,
        this.errors,
        this.result,
        this.userID,
        this.userImageURL,
        this.userName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'];
    if (json['Errors'] != null) {
      errors = new List<Null>();
      json['Errors'].forEach((v) {
      //  errors.add(new Null.fromJson(v));
      });
    }
    result = json['Result'];
    userID = json['UserID'];
    userImageURL = json['UserImageURL'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    if (this.errors != null) {
   //   data['Errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    data['Result'] = this.result;
    data['UserID'] = this.userID;
    data['UserImageURL'] = this.userImageURL;
    data['UserName'] = this.userName;
    return data;
  }
}