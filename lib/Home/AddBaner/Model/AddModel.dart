class AddModel {
  List<Null> errors;
  bool result;

  AddModel({this.errors, this.result});

  AddModel.fromJson(Map<String, dynamic> json) {
    if (json['Errors'] != null) {
      errors = new List<Null>();
      json['Errors'].forEach((v) {
    //    errors.add(new Null.fromJson(v));
      });
    }
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
     // data['Errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    data['Result'] = this.result;
    return data;
  }
}