import 'dart:convert';

import 'package:bis_building/Home/HomeScreen.dart';
import 'package:bis_building/Login/Model/LoginModel.dart';
import 'package:bis_building/Login/Widgets/LoginItem.dart';
import 'package:bis_building/Sign%20up/Model/SignUpModel.dart';
import 'package:bis_building/Sign%20up/Widgets/LoginItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpControler {
  final api ='http://bisbuilding-001-site1.htempurl.com/BISBuildingWS.svc/CreateUser';
  final  Dio _dio= Dio();
  SignUpModel _signUpModel=SignUpModel();

  Future<SignUpModel> userSignUP({String email ,String password,BuildContext context,String firstName,String lastName,String phoneNumber}) async {
    final data = {'Email':email,'Password':password,'FirstName':firstName,'LastName':lastName,'PhoneNumber':phoneNumber};
    Response response;
    response= await _dio.post(api,data: data);
    var data2=json.decode(response.toString());
    _signUpModel=SignUpModel.fromJson(data2);
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString("UserToken", _signUpModel.userID.toString());

    final body=response.data;
    if(body['Result'] == true){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen()));
    }else{
      SignUpshowAlertDialog(
        context: context,
        erorrtext: body['Errors'][0]['ErrorMSG'],
      );
    }
    return _signUpModel;

  }
}