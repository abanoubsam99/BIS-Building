import 'dart:convert';

import 'package:bis_building/Home/HomeScreen.dart';
import 'package:bis_building/Login/Model/LoginModel.dart';
import 'package:bis_building/Login/Widgets/LoginItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControler {
  final api ='http://bisbuilding-001-site1.htempurl.com/BISBuildingWS.svc/Login';
  final  Dio _dio= Dio();
  LoginModel _loginModel=LoginModel();

  Future<LoginModel> userlogin({String email ,String password,BuildContext context }) async {
    final data = {'UserName':email,'Password':password};
    Response response;
    response= await _dio.post(api,data: data);
    var data2=json.decode(response.toString());
    _loginModel=LoginModel.fromJson(data2);
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString("UserToken", _loginModel.data.toString());

    final body=response.data;
    if(body['Result'] == true){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()));
    }else{
      showAlertDialog(context);
    }
    return _loginModel;

  }
}