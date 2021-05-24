import 'dart:convert';
import 'dart:io';

import 'package:bis_building/Home/AddBaner/Controller/AddController.dart';
import 'package:bis_building/Home/AddBaner/Model/AddModel.dart';
import 'package:bis_building/Home/AddBaner/Widgets/Alert.dart';
import 'package:bis_building/Home/AddBaner/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;

class AddBanerScreen extends StatefulWidget {
  @override
  _AddBanerScreenState createState() => _AddBanerScreenState();
}

class _AddBanerScreenState extends State<AddBanerScreen> {
  AddControler _addControler= AddControler();
  AddModel _addModel=AddModel();
  String _title ,_phone , _address , _details , _area;
  double _price;
  int _departmentID=0,_status=0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _imagecover;
  final picker = ImagePicker();
  final pickercover = ImagePicker();

  String base64Str='';

  Future getImageCover(ImageSource source) async {
    final pickedFile = await pickercover.getImage(source: source);

    setState(()  {
      _imagecover = File(pickedFile.path);
      print(_imagecover);
      final bytes = _imagecover.readAsBytesSync();
       base64Str = base64Encode(bytes);
      print(base64Str);
    });
  }

  String Sectiondropdownvalue ;
  String Statusdropdownvalue ;


  Widget _SectionCustomDropdown(){
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
                    value: Sectiondropdownvalue,
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
                        Sectiondropdownvalue = newValue;
                        switch (Sectiondropdownvalue) {
                          case "  Apartments":
                            return _departmentID=1;
                          case "  Chalets":
                            return  _departmentID=2;
                          case "  Agricultural land":
                            return  _departmentID=3;
                          case "  Shops":
                            return  _departmentID=4;
                          case "  Villas":
                            return  _departmentID=5;
                          case "  Condominium ":
                            return  _departmentID=6;
                        }

                      });
                    },
                  ),
                ),
              ),
            ),
          );
  }



  Widget _StatusCustomDropdown( ){
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
                    value: Statusdropdownvalue,
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
                        Statusdropdownvalue = newValue;
                        switch (Statusdropdownvalue) {
                          case " Sale":
                            return _status=1;
                          case " Rent":
                            return  _status=2;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .accentColor,
      appBar: AppBar(
        title: Text(
          "Add Building", style: TextStyle(color: Colors.white, fontSize: 25,),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            }),


      ),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.transparent,
              ),
              _imagecover==null ?Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(image: AssetImage("Assets/addcover.jpg"),fit: BoxFit.cover)
                ),
              ): Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image:
                  DecorationImage(image: FileImage(_imagecover), fit: BoxFit.cover),
                ),
              ),

              Positioned(top: 5,right: 5,child: IconButton(icon: Icon(Icons.edit,color: Colors.white,), onPressed: (){
                getImageCover(ImageSource.gallery);
              })),
            ],),


            CustomTextfild(hint: "Title", icon:Icons.title ,onclick: (value) { _title = value; }, textInputType: TextInputType.text,maxLines: 1,),
            CustomTextfild(hint: "Price", icon:Icons.monetization_on ,onclick: (value) { _price = double.parse(value); }, textInputType: TextInputType.number,maxLines: 1),
            CustomTextfild(hint: "Phone number",  icon:Icons.phone, onclick: (value) { _phone = value; }, textInputType: TextInputType.phone,maxLines: 1),
            CustomTextfild(hint: "Area", icon:Icons.aspect_ratio,  onclick: (value) { _area = value; }, textInputType: TextInputType.number,maxLines: 1),
            CustomTextfild(hint: "Address",  icon:Icons.location_on, onclick: (value) { _address = value; }, textInputType: TextInputType.text,maxLines: 1),

            Padding(  padding: const EdgeInsets.all(10.0),
              child:   _SectionCustomDropdown(),
            ),
            Padding(  padding: const EdgeInsets.all(10.0),
              child:   _StatusCustomDropdown(),
            ),
            CustomTextfild(hint: "Details",  onclick: (value) { _details = value; }, textInputType: TextInputType.text,maxLines: 5,icon: Icons.info_outline,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: (){
                  setState(() {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if(_departmentID==0){
                        CheckshowAlertDialog(context, 'Section');
                      }
                      else if(_status==0){
                        CheckshowAlertDialog(context, "Status");

                      }else if(base64Str==''){
                        CheckshowAlertDialog(context, "image");
                      }
                      else{
                        _addControler.CreateAnnouncement(userImage: base64Str,status: _status,departmentID: _departmentID,context: context,title: _title,
                        price: _price,address: _address,area: _area,details: _details,Phone: _phone);
                        Navigator.pop(context);
                      }
                    } else {
                      print("login validator error");
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(" Upload ",style: TextStyle(color: Colors.white,fontSize: 23),),),
                ),
              ),
            ),

            SizedBox(height: 20,),
          ],),
      ),
    );
  }
}
