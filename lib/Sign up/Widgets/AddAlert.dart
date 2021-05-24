import 'package:bis_building/Login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> CheckUsershowAlertDialog({BuildContext context})async  {
  return  showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('You Should Login '),
        content: Text('You must log in first in order to add ads Or View Your Building '),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Login'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
          ),
        ],
      );
    },
  );
}
