import 'package:bis_building/Home/HomeScreen.dart';
import 'package:bis_building/Login/Controller/LoginController.dart';
import 'package:bis_building/Login/Widgets/LoginItem.dart';
import 'package:bis_building/Sign%20up/SigUpScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginControler _loginControler = LoginControler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
             children: [
               Container(  width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*1/3,
                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("Assets/logo.png"))),
                 ),
             Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height*2/3,
           decoration: BoxDecoration(
             color: Theme.of(context).accentColor,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
            SizedBox(height: 10,),
             Text("Login",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30,fontWeight: FontWeight.bold),),
               SizedBox(height: 10,),
               CustomTextfild(
                   hint: "Email or Phone Number",
                   secure: false,
                   onclick: (value) {  _email = value;},
                   textInputType:  TextInputType.text
               ),

               CustomTextfild(
                   hint: "Password",
                   secure: true,
                   onclick: (value) {  _password = value;},
                   textInputType:  TextInputType.visiblePassword
               ),

             Padding(
               padding: const EdgeInsets.all(20),
               child: InkWell(
                 onTap: () {
                   setState(() {
                     if (_formKey.currentState.validate()) {
                       _formKey.currentState.save();
                       _loginControler.userlogin(email: _email,password: _password,context: context );
                     } else {
                       print("login validator error");
                     }
                   });
                 },
                 child: Container(
                   height: 50,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Theme.of(context).primaryColor),
                   child: Center(
                     child: Text(
                       "Login",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
               ),
             ),
               SizedBox(height: 40,),
               InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => SignUpScreen()));
               },
               child: Text("Don't have any account ? Sign Up",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold),)),
               SizedBox(height: 10,),

             ],),
     ),

],
          ),
        ),
      ),
    );
  }
}
