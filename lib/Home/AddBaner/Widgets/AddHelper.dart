import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddHelper{
  BuildContext context;
  void Function(void Function()) setState;
  AddHelper({@required this.context,@required this.setState});
  String _Sectionvalue ;
  String _Statusvalue ;
  int _departmentID=0,_status=0;
  SectionCustomDropdown({String sectionvalue,int department}){
    var items =  [ "  Apartments", "  Chalets",    "  Agricultural land",    "  Shops",    "  Villas",    "  Condominium ",];
    return  Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.white ),
      child: Padding(
        padding: const EdgeInsets.only(right: 3),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _Sectionvalue,
              style: TextStyle(fontSize:15,color:Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              hint: Text("  Section"),
              icon: Icon(Icons.keyboard_arrow_down,color: Theme.of(context).primaryColor,),
              items:items.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items)
                );
              }
              ).toList(),
              onChanged: (String newValue){
                setState(() {
                  sectionvalue = newValue;
                  _Sectionvalue=sectionvalue;
                  switch (_Sectionvalue) {
                    case "  Apartments":
                      _departmentID=1;
                      return department=_departmentID;
                    case "  Chalets":
                      _departmentID=2;
                      return  department=_departmentID;
                    case "  Agricultural land":
                      _departmentID=3;
                      return  department=_departmentID;
                    case "  Shops":
                      _departmentID=4;
                      return  department=_departmentID;
                    case "  Villas":
                      _departmentID=5;
                      return  department=_departmentID;
                    case "  Condominium ":
                      _departmentID=6;
                      return  department=_departmentID;
                  }

                });
              },
            ),
          ),
        ),
      ),
    );
  }



   StatusCustomDropdown( {String  Statusval,int status }){
    var items =  [ " Sale",    " Rent", ];
    return  Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.white ),
      child: Padding(
        padding: const EdgeInsets.only(right: 3),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _Statusvalue,
              style: TextStyle(fontSize:15, color:Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
              hint: Text("  Status"),
              icon: Icon(Icons.keyboard_arrow_down,color: Theme.of(context).primaryColor,),
              items:items.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items)
                );
              }
              ).toList(),
              onChanged: (String newValue){
                setState(() {
                  Statusval = newValue;
                  _Statusvalue=Statusval;
                  switch (_Statusvalue) {
                    case " Sale":
                      _status=1;
                      return status=_status;
                    case " Rent":
                      _status=2;
                      return  status=_status;
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }


}