import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class Forgot_password_oage extends StatefulWidget {
  const Forgot_password_oage({Key? key}) : super(key: key);


  @override
  _Forgot_password_oageState createState() => _Forgot_password_oageState();
}

class _Forgot_password_oageState extends State<Forgot_password_oage> {
  var _formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ElevatedButton(onPressed: _resetPassword, child: Text("REsed Password"))
              ],
            ),

          ),
        ),
      ),
    );
  }
  _resetPassword()async{
    if(_formKey.currentState!.validate()){
      try{
        _formKey.currentState!.save();
        print(email);
        await _authUser.sendPasswordResetEmail(email: email!);
      }catch(e){
        print("Email Topilmadi Yoki Eror !");
      }
    }
  }
}
