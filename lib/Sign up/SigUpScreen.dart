import 'package:bis_building/Home/HomeScreen.dart';
import 'package:bis_building/Login/LoginScreen.dart';
import 'package:bis_building/Login/Widgets/LoginItem.dart';
import 'package:bis_building/Sign%20up/Controller/SignUpController.dart';
import 'package:bis_building/Sign%20up/Widgets/LoginItem.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String  _email, _password,_firstname,_lastname,_phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpControler _signUpControler = SignUpControler();
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
                height: MediaQuery.of(context).size.height*1/8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 5,right: 20,left: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,), onPressed: (){
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    }),
                      Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 30),),
                      SizedBox(width: 10,),
                  ],),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*7/8,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 40,bottom: 20),
                  children: [
                    SignUpCustomTextfild(
                        hint: "First name",
                        secure: false,
                        onclick: (value) {  _firstname = value;},
                        textInputType:  TextInputType.text
                    ),
                    SignUpCustomTextfild(
                        hint: "Last name",
                        secure: false,
                        onclick: (value) {  _lastname = value;},
                        textInputType:  TextInputType.text
                    ),
                    SignUpCustomTextfild(
                        hint: "PhoneNumber",
                        secure: false,
                        onclick: (value) {  _phoneNumber = value;},
                        textInputType:  TextInputType.phone
                    ),
                    SignUpCustomTextfild(
                        hint: "Email",
                        secure: false,
                        onclick: (value) {  _email = value;},
                        textInputType:  TextInputType.text
                    ),
                    SignUpCustomTextfild(
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
                              _signUpControler.userSignUP(context: context,
                              password: _password,email: _email,firstName: _firstname,lastName: _lastname,phoneNumber: _phoneNumber );

                            } else {
                              print("Sign Up validator error");
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
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Center(child: Text("Already have any account ? Sign In",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold),))),
                    SizedBox(height: 9,),

                  ],),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
