import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTextfild extends StatelessWidget {
  String hint;
  bool secure;
  IconData icon;
  TextInputType textInputType;
  final Function onclick;
  String _errorMessage(String error) {
    switch (hint) {
      case "Email or Phone Number":
        return "You Should Enter Email or Phone Number";
      case "Password":
        return "You Should Enter Password";
    }
  }

  CustomTextfild({
    @required this.hint,
    @required this.secure,
    @required this.onclick,
    @required this.textInputType,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return _errorMessage(hint);
            }
          },
          onSaved: onclick,
          obscureText: secure,
          keyboardType: textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              borderSide: BorderSide(
                color:Colors.red,
              ),
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              borderSide: BorderSide(
                color:Theme.of(context).primaryColor,
              ),
            ) ,
            labelText: hint,
            hintText: "Enter "+hint,
            hintStyle:  TextStyle(color: Colors.grey,fontSize: 17),
            labelStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              borderSide: BorderSide(
                color:Theme.of(context).primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              borderSide: BorderSide(
                color:Theme.of(context).primaryColor
              ),
            ),

          ),
          style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),

        ),
      ),
    );
  }
}



showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Ok"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Login Error",style: TextStyle(color: Colors.red),)),
    content: Text("Please Check Email / Phone Number or Password"),
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
