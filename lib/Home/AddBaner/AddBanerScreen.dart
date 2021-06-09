import 'dart:convert';
import 'dart:io';

import 'package:bis_building/Home/AddBaner/Controller/AddController.dart';
import 'package:bis_building/Home/AddBaner/Model/AddModel.dart';
import 'package:bis_building/Home/AddBaner/Widgets/AddHelper.dart';
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
  AddHelper _addHelper;

  AddControler _addControler= AddControler();
  String _title ,_phone , _address , _details , _area;
  double _price;
  int _departmentID,_status;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _imagecover;
  final picker = ImagePicker();
  final pickercover = ImagePicker();

  String base64Str='';

  Future getImageCover() async {
    final pickedFile = await pickercover.getImage(source: ImageSource.gallery);
    setState(()  {
      _imagecover = File(pickedFile.path);
      print(_imagecover);
      final bytes = _imagecover.readAsBytesSync();
       base64Str = base64Encode(bytes);
      print(base64Str);
    });
  }
  String _Sectionvalue,_Statusvalue ;
  @override
  void initState() {
    _addHelper=AddHelper(context: context, setState: setState);
    super.initState();
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
                getImageCover();
              })),
            ],),


            AddTextfild(hint: "Title", icon:Icons.title ,onclick: (value) { _title = value; }, textInputType: TextInputType.text,maxLines: 1,),
            AddTextfild(hint: "Price", icon:Icons.monetization_on ,onclick: (value) { _price = double.parse(value); }, textInputType: TextInputType.number,maxLines: 1),
            AddTextfild(hint: "Phone number",  icon:Icons.phone, onclick: (value) { _phone = value; }, textInputType: TextInputType.phone,maxLines: 1),
            AddTextfild(hint: "Area", icon:Icons.aspect_ratio,  onclick: (value) { _area = value; }, textInputType: TextInputType.number,maxLines: 1),
            AddTextfild(hint: "Address",  icon:Icons.location_on, onclick: (value) { _address = value; }, textInputType: TextInputType.text,maxLines: 1),
            AddTextfild(hint: "Details",  onclick: (value) { _details = value; }, textInputType: TextInputType.text,maxLines: 5,icon: Icons.info_outline,),

            Padding(  padding: const EdgeInsets.all(10.0),
              child:   _addHelper.SectionCustomDropdown(department:  _departmentID,sectionvalue:  _Sectionvalue),
            ),
            Padding(  padding: const EdgeInsets.all(10.0),
              child:   _addHelper.StatusCustomDropdown(status: _status,Statusval: _Statusvalue),
            ),

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
