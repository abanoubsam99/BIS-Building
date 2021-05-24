import 'package:bis_building/Color.dart';
import 'package:bis_building/Deyails/DetailsScreen.dart';
import 'package:bis_building/Home/HomePage/Controller/AnnouncementController.dart';
import 'package:bis_building/Home/HomePage/Model/AnnouncementModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BuildingItem extends StatefulWidget {
  int DepartmentID;
  BuildingItem({@required this.DepartmentID});

  @override
  _BuildingItemState createState() => _BuildingItemState();
}

class _BuildingItemState extends State<BuildingItem> {
  AnnouncementController _announcementController= AnnouncementController();
  AnnouncementModel _announcementModel=AnnouncementModel();
  bool _loading=true;
 _getAnnouncement () async{
    _announcementModel=await _announcementController.GetAnnouncement(id: widget.DepartmentID);
    setState(() {
      _loading=false;
    });
  }
  @override
  void initState() {
    _getAnnouncement();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   return _loading ?
   Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),)
       : _announcementModel.data.isEmpty? Container(child: Center(child: Text("No advertisement has been added yet"),),)
       :Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: ListView.builder(
            itemCount: _announcementModel.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        DetailsScreen(
                          size:  _announcementModel.data[index].area,
                          title: _announcementModel.data[index].title,
                          image: _announcementModel.data[index].image==null?"https://image.freepik.com/free-photo/house-isolated-field_1303-23773.jpg":_announcementModel.data[index].image,
                          price:_announcementModel.data[index].price,
                          description:_announcementModel.data[index].details,
                          location: _announcementModel.data[index].address,
                          phonen:_announcementModel.data[index].phone,
                          status:_announcementModel.data[index].status,
                          name:_announcementModel.data[index].ownerName ,
                          creationDate:_announcementModel.data[index].creationDate ,
                        )));
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 210,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.2, .2), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ]
                    ),
                    child: Column(
                      children: [
                        Stack(children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 110,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(15)),
                                image: DecorationImage(image: NetworkImage(
                                    _announcementModel.data[index].image==null?"https://image.freepik.com/free-photo/house-isolated-field_1303-23773.jpg":_announcementModel.data[index].image),
                                    fit: BoxFit.fitWidth)
                            ),

                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.2),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(15)),
                            ),

                          ),

                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.85),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(child: Text(
                                  _announcementModel.data[index].status,
                                  style: TextStyle(color: Color(
                                      getColorHexFromStr("#A8943D")),
                                      fontSize: 18),),
                                )),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Text(_announcementModel.data[index].area,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)
                            ),
                          )
                        ],),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_announcementModel.data[index].title,
                                  style: TextStyle(color: Theme
                                      .of(context)
                                      .primaryColor, fontSize: 18)),
                              Text(_announcementModel.data[index].price.toString() + "\$",
                                style: TextStyle(
                                    color: Color(getColorHexFromStr("#A8943D")),
                                    fontSize: 18),
                              )
                            ],),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 5, right: 10, left: 10),
                            child: Text(
                              _announcementModel.data[index].details,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );

  }
}

