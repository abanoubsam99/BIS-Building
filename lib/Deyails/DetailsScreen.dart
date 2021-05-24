import 'package:bis_building/Color.dart';
import 'package:bis_building/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailsScreen extends StatefulWidget {
  String title,image,phonen,description,location,size,status,name,creationDate;
  double price;
  DetailsScreen({@required this.title,@required this.size,@required this.description,@required this.image, @required this.location,@required this.phonen,@required this.price,@required this.status,@required this.name,@required this.creationDate,});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<void> _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Widget _dataitem(String title,IconData icon){
    return Row(children: [
      Icon(icon,color: Theme.of(context).primaryColor,size: 30,),
      SizedBox(width: 5,),
      Text(title ,style: TextStyle(color: Colors.black,fontSize: 14),)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
                image: DecorationImage(image:  NetworkImage(widget.image),
                    fit: BoxFit.cover)
            ),
          ),
          Positioned(
            top: 20,
            left: 7,
            child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
              Navigator.pop(context);
            }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2-50,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2+50,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight:  Radius.circular(50))
              ),
              child:   Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                 children: [
                   Expanded(child:
                   ListView(
                     scrollDirection: Axis.vertical,
                     padding:  EdgeInsets.only(top: 10,bottom: 10),
                     children: [

                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(child: Text(widget.title, style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18))),
                           Text(widget.price.toString() +"\$", style: TextStyle(color: Color(getColorHexFromStr("#A8943D")),fontSize: 18), ),
                         ],),
                       SizedBox(height:10 ,),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           _dataitem(widget.name, Icons.person),
                           Container(height: 30, child: VerticalDivider(color: Colors.black,width: 3,)),
                           _dataitem(widget.size+" M", Icons.aspect_ratio),
                           Container(height: 30, child: VerticalDivider(color: Colors.black,width: 3,)),
                           _dataitem(widget.status, Icons.location_city),

                         ],),
                       SizedBox(height:10 ,),
                       _dataitem(widget.creationDate, Icons.access_time),

                       SizedBox(height:10 ,),
                       Row(
                         children: [
                           _dataitem(widget.location, Icons.location_on),
                         ],
                       ),
                       SizedBox(height:10 ,),

                       Text(widget.description,
                         style: TextStyle(color: Colors.grey),
                       ),

                     ],)),

                   InkWell(
                     onTap: () {
                       setState(() {
                           _launched = _makePhoneCall('tel:'+  widget.phonen);

                         /*
                         Navigator.pushReplacement(
                             context, MaterialPageRoute(builder: (context) => HomeScreen()));
                         */
                       });
                     },
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Container(
                         height: 50,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Theme.of(context).primaryColor),
                         child: Center(
                           child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               SizedBox(width: 5,),
                               Icon(Icons.call,color: Colors.white,size: 30,),
                               Text(
                                 widget.phonen,
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 25,
                                     ),
                               ),
                               SizedBox(width: 5,),

                             ],
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
