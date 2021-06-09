import 'package:bis_building/Home/HomePage/Widgets/BuildingItem.dart';
import 'package:bis_building/Login/LoginScreen.dart';
import 'package:bis_building/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  String _tokin;
  bool _loading=true;

  _getToken() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    _tokin =_sharedPreference.get("UserToken");
    setState(() {
      _loading=false;
    });
  }
  TabController _tabController;
  List<String> _tabtitle = [
    "Apartments",
    "Chalets",
    "Agricultural land",
    "Shops",
    "Villas",
    "Condominium ",
  ];
  @override
  void initState() {
    _getToken();
    super.initState();
    _tabController = TabController(length: _tabtitle.length, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        elevation: 1,
        title: Text("BIS Building",style: TextStyle(fontSize: 25),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("Assets/logo.png"),
        ),

        actions: [
          _loading ?
          Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),)
              :_tokin==null?IconButton(icon: Icon(Icons.login,color: Colors.white,), onPressed: ()  {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginScreen()));
          })
              : IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed: () async {
            SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
            _sharedPreference.remove("UserToken");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SplashScreen()));
          })
        ],
        bottom: TabBar(
          tabs: _tabtitle.map((String name) => Tab(text: name)).toList(),
          controller: _tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.5,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        BuildingItem(DepartmentID: 1,DepartmentName:"Apartments" ,),
        BuildingItem(DepartmentID: 2,DepartmentName:"Chalets" ),
        BuildingItem(DepartmentID: 3,DepartmentName:"Agricultural land" ),
        BuildingItem(DepartmentID: 4,DepartmentName:"Shops" ),
        BuildingItem(DepartmentID: 5,DepartmentName:"Villas" ),
        BuildingItem(DepartmentID: 6,DepartmentName:"Condominium" ),

      ]),

    );
  }
}
