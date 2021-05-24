import 'dart:convert';

import 'package:bis_building/Home/HomePage/Model/AnnouncementModel.dart';
import 'package:dio/dio.dart';

class AnnouncementController {
  AnnouncementModel _announcementModel=AnnouncementModel();

  Future<AnnouncementModel> GetAnnouncement({int id}) async {
    var dio = Dio();
    final response = await dio.get('http://bisbuilding-001-site1.htempurl.com/BISBuildingWS.svc/GetAnnouncementList',
      options: Options(
          headers: {
            'DepartmentID':id
          },
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          }
      ),
    );
    var data=json.decode(response.toString());
    _announcementModel=AnnouncementModel.fromJson(data);

    return _announcementModel;
  }


}