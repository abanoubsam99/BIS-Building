import 'package:bis_building/Home/HomePage/Widgets/BuildingItem.dart';
import 'package:bis_building/Home/MyBuilding/Controller/MyBuildingController.dart';
import 'package:bis_building/Home/MyBuilding/Model/MyBuildingModel.dart';
import 'package:bis_building/Home/MyBuilding/Widgets/MyBuilding%20Item.dart';
import 'package:flutter/material.dart';
class MyBuilding extends StatefulWidget {
  @override
  _MyBuildingState createState() => _MyBuildingState();
}

class _MyBuildingState extends State<MyBuilding> {

  MyBuildingModel _buildingModel=MyBuildingModel();
  MyBuildingController _myBuildingController=MyBuildingController();
  bool _loading=true;
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
          : _buildingModel.data.isEmpty? Container(child: Center(child: Text("No advertisement has been added yet"),),)
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
            );
          },
        ),
      )
        ,
    );
  }
}
