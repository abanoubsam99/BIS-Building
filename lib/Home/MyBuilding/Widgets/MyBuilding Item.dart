import 'package:bis_building/Color.dart';
import 'package:bis_building/Deyails/DetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyBuildingItem extends StatefulWidget {
  String title,image,phonen,description,location,size,status,name,creationDate;
  double price;
  MyBuildingItem({@required this.title,@required this.size,@required this.description,@required this.image, @required this.location,@required this.phonen,@required this.price,@required this.status,@required this.name,@required this.creationDate});

  @override
  _MyBuildingItemState createState() => _MyBuildingItemState();
}

class _MyBuildingItemState extends State<MyBuildingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  DetailsScreen(
                    size: widget.size,
                    title: widget.title,
                    image: widget.image==null?"https://image.freepik.com/free-photo/house-isolated-field_1303-23773.jpg":widget.image,
                    price:widget.price,
                    description:widget.description,
                    location: widget.location,
                    phonen:widget.phonen,
                    status:widget.status,
                    creationDate: widget.creationDate,
                    name: widget.name,
                  )));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(15)),
                          image: DecorationImage(image:  NetworkImage( widget.image==null?"https://image.freepik.com/free-photo/house-isolated-field_1303-23773.jpg":widget.image),
                              fit: BoxFit.fitWidth)
                      ),

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.2),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(15)),
                      ),

                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(icon: Icon(Icons.close,color: Colors.red), onPressed: (){})
                    ),
                    Positioned(
                      top: 10,
                      left:  MediaQuery.of(context).size.width/7,
                      child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.85),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(child: Text("Sale", style: TextStyle(color: Color(getColorHexFromStr("#A8943D")),fontSize: 18),),
                          )),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Text("120 M", style: TextStyle(color: Colors.white,fontSize: 18)
                      ),
                    )
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title, style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18)),
                        Text(widget.price.toString() +"\$", style: TextStyle(color: Color(getColorHexFromStr("#A8943D")),fontSize: 18),
                        )
                      ],),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0,bottom: 5,right: 10,left: 10),
                      child: Text(widget.description,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );

  }
}
