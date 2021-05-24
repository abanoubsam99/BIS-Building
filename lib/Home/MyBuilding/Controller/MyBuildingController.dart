import 'dart:convert';

import 'package:bis_building/Home/HomePage/Model/AnnouncementModel.dart';
import 'package:bis_building/Home/MyBuilding/Model/MyBuildingModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyBuildingController {
  MyBuildingModel _myBuildingModel=MyBuildingModel();
  String _tokin;

  Future<MyBuildingModel> GetMyBuilding() async {
    var dio = Dio();
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    _tokin =_sharedPreference.get("UserToken");
print(_tokin);
    final response = await dio.get('http://bisbuilding-001-site1.htempurl.com/BISBuildingWS.svc/GetMyBuildingAnnouncementList',
      options: Options(
          headers: {
            'UserToken':_tokin
          },
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          }
      ),
    );
    var data=json.decode(response.toString());
    _myBuildingModel=MyBuildingModel.fromJson(data);

    return _myBuildingModel;
  }


}