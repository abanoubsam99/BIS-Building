import 'package:flutter/material.dart';

class AddTextfild extends StatelessWidget {
  String hint;
  IconData icon;
  int maxLines;
  TextInputType textInputType;
  final Function onclick;
  String _errorMessage(String error) {
    switch (hint) {
      case "Title":
        return "You Should Enter Title";
      case "Price":
        return "You Should Enter Price";
      case "Phone number":
        return "You Should Enter Phone number";
      case "Address":
        return "You Should Enter Address";
      case "Area":
        return "You Should Enter Area";
      case "Details":
        return "You Should Enter Details";

    }
  }

  AddTextfild({
    @required this.hint,
    @required this.icon,
    @required this.onclick,
    @required this.textInputType,
    @required this.maxLines
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return _errorMessage(hint);
            }
          },
          onSaved: onclick,
          obscureText: false,
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
            alignLabelWithHint: true,
            prefixIcon: Icon(icon,color: Theme.of(context).primaryColor,),
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
          style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),maxLines: maxLines,

        ),
      ),
    );
  }
}
