import 'dart:convert';

import 'package:bis_building/Home/AddBaner/Model/AddModel.dart';
import 'package:bis_building/Home/AddBaner/Widgets/Alert.dart';
import 'package:bis_building/Home/AddBaner/Widgets/CustomTextField.dart';
import 'package:bis_building/Home/HomeScreen.dart';
import 'package:bis_building/Login/Model/LoginModel.dart';
import 'package:bis_building/Login/Widgets/LoginItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddControler {
  final api ='http://bisbuilding-001-site1.htempurl.com/BISBuildingWS.svc/CreateAnnouncement';
  final  Dio _dio= Dio();
  AddModel _addModel=AddModel();
  String _tokin;

  Future<AddModel> CreateAnnouncement({String userImage,String title ,String Phone ,int departmentID ,double price ,int status ,String address ,String details ,String area,BuildContext context }) async {
    final data = {'UserImage':userImage,'Title':title,'Area':area,'Phone':Phone,'DepartmentID':departmentID,'Price':price,'Status':status,'Address':address,'Details':details};
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    _tokin =_sharedPreference.get("UserToken");

    Response response;
    response= await _dio.post(api,data: data,
      options: Options(
        headers: {
          "UserToken":_tokin,
        },
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        }
    ),
    );
    var data2=json.decode(response.toString());
    _addModel=AddModel.fromJson(data2);

    final body=response.data;
    if(body['Result'] == true){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()));
    }else{
      AddshowAlertDialog(
        context: context,
        erorrtext: body['Errors'][0]['ErrorMSG'],
      );
    }
    return _addModel;

  }
}