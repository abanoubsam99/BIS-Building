import 'package:bis_building/Home/HomePage/Widgets/BuildingItem.dart';
import 'package:bis_building/Home/MyBuilding/Controller/MyBuildingController.dart';
import 'package:bis_building/Home/MyBuilding/Model/MyBuildingModel.dart';
import 'package:bis_building/Home/MyBuilding/Widgets/MyBuilding%20Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyBuilding extends StatefulWidget {
  @override
  _MyBuildingState createState() => _MyBuildingState();
}

class _MyBuildingState extends State<MyBuilding> {

  MyBuildingModel _buildingModel=MyBuildingModel();
  MyBuildingController _myBuildingController=MyBuildingController();
  bool _loading=true;
  Future<void> DeleteshowAlertDialog({int id})async  {
    return  showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(' Delete Message ',style: TextStyle(color: Colors.red),),
          content: Text("Are you sure you want to delete? "),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Cancel',style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Delete',style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: () async {
               await _myBuildingController.DeleteMyBuilding(context: context,id:id ).then(((value){_loading=true; _getmyBuilding();  Navigator.of(context).pop();
               }));
              },
            ),
          ],
        );
      },
    );
  }

  _getmyBuilding () async{
    _buildingModel=await _myBuildingController.GetMyBuilding();
    setState(() {
      _loading=false;
    });
  }
  @override
  void initState() {
    _getmyBuilding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("My Buildings",style: TextStyle(fontSize: 25),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("Assets/logo.png"),
        ),
      ),
      body: _loading ?
      Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),)
          : _buildingModel.data.isEmpty? Container(child: Center(child: Text("No Building Has Been Added Yet"),),)
          :Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:ListView.builder(
          itemCount: _buildingModel.data.length,
          itemBuilder: (context, index) {
            return MyBuildingItem(
              title: _buildingModel.data[index].title,
              image: _buildingModel.data[index].image,
              status:_buildingModel.data[index].status ,
              phonen: _buildingModel.data[index].phone,
              location: _buildingModel.data[index].address,
              description: _buildingModel.data[index].details,
              price: _buildingModel.data[index].price,
              size:_buildingModel.data[index].area ,
              name: _buildingModel.data[index].ownerName ,
              creationDate: _buildingModel.data[index].creationDate ,
              deletel: (){
                DeleteshowAlertDialog(id:_buildingModel.data[index].iD );
                },
            );
          },
        ),
      )
        ,
    );
  }
}
