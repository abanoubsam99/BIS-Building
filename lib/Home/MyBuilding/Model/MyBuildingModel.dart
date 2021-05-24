class MyBuildingModel {
  List<Data> data;
  List<Null> errors;
  bool result;

  MyBuildingModel({this.data, this.errors, this.result});

  MyBuildingModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    if (json['Errors'] != null) {
      errors = new List<Null>();
      json['Errors'].forEach((v) {
      //  errors.add(new Null.fromJson(v));
      });
    }
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.errors != null) {
  //    data['Errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    data['Result'] = this.result;
    return data;
  }
}

class Data {
  String address;
  String area;
  String creationDate;
  String departmentName;
  String details;
  int iD;
  String image;
  String ownerName;
  String phone;
  double price;
  String status;
  String title;

  Data(
      {this.address,
        this.area,
        this.creationDate,
        this.departmentName,
        this.details,
        this.iD,
        this.image,
        this.ownerName,
        this.phone,
        this.price,
        this.status,
        this.title});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    area = json['Area'];
    creationDate = json['CreationDate'];
    departmentName = json['DepartmentName'];
    details = json['Details'];
    iD = json['ID'];
    image = json['Image'];
    ownerName = json['OwnerName'];
    phone = json['Phone'];
    price = json['Price'];
    status = json['Status'];
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['Area'] = this.area;
    data['CreationDate'] = this.creationDate;
    data['DepartmentName'] = this.departmentName;
    data['Details'] = this.details;
    data['ID'] = this.iD;
    data['Image'] = this.image;
    data['OwnerName'] = this.ownerName;
    data['Phone'] = this.phone;
    data['Price'] = this.price;
    data['Status'] = this.status;
    data['Title'] = this.title;
    return data;
  }
}