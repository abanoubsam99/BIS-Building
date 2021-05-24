
import 'package:bis_building/Home/AddBaner/AddBanerScreen.dart';
import 'package:bis_building/Home/HomePage/HomePage.dart';
import 'package:bis_building/Home/MyBuilding/MyBuilding.dart';
import 'package:bis_building/Sign%20up/Widgets/AddAlert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Properties & Variables needed
  String _tokin;
  _getToken() async {
  SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
  _tokin =_sharedPreference.get("UserToken");
}
  _checkLogin() async {
    if(_tokin==null){
      CheckUsershowAlertDialog(context: context);
    }
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddBanerScreen()));
  }
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    MyBuilding(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport

  @override
  Future<void> initState()  {
    _getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: ()  {
          _checkLogin();

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            HomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          size: 35,
                          color: currentTab == 0 ? Theme.of(context).primaryColor : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Theme.of(context).primaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        if(_tokin==null){
                          CheckUsershowAlertDialog(context: context);
                        }
                        else{
                          currentScreen =
                              MyBuilding(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        }

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cloud_upload,
                          size: 35,
                          color: currentTab == 1 ? Theme.of(context).primaryColor : Colors.grey,
                        ),
                        Text(
                          'MyBuilding',
                          style: TextStyle(
                            color: currentTab == 1 ? Theme.of(context).primaryColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
