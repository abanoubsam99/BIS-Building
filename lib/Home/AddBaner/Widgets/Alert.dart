import 'package:flutter/material.dart';
AddshowAlertDialog({BuildContext context,String erorrtext}) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Ok"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Add Building Error",style: TextStyle(color: Colors.red),)),
    content: Text(erorrtext),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



CheckshowAlertDialog(BuildContext context,String errormessage) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Ok"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Add Building Error",style: TextStyle(color: Colors.red),)),
    content: Text("Please choose "+errormessage),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

