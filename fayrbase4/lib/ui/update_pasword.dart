import 'package:fayrbase4/ui/mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
class UpdatePaswordPage extends StatefulWidget {
  const UpdatePaswordPage({Key? key}) : super(key: key);
  @override
  _UpdatePaswordPageState createState() => _UpdatePaswordPageState();
}

class _UpdatePaswordPageState extends State<UpdatePaswordPage> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Apdate page"),

      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode:  AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: password,
                  validator: (text){
                    if(text!.length<6){

                      return "6 ta belginidan kam bolmasin ";
                    }


                  },

                ),

              ),
              TextFormField(
                controller:  confirmpassword,
                validator: (text){
                  if(text!.isEmpty){
                    return "Bosh bolmasligi kerak";
                  }else{
                    if(password.text != confirmpassword.text){
                      print("Yangi password"+ password.text);
                      return "Passwordlar togri kelmadi";
                    }
                  }
                },
              ),
              ElevatedButton(onPressed: _updatePasword,
                  child: Text("Update passwprd"),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
              ),
            ],
          ),

        ),
      ),

    );
  }
  _updatePasword()async{
     if(_formKey.currentState!.validate()){
       try{
         _formKey.currentState!.save();
         print("Update Password Methodida Confirm Password" + confirmpassword.text);
         await _auth.currentUser!.updatePassword(confirmpassword.text);
         await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
       }catch(e){
         print("Email topilmadi yoki Eror");
       }
     }
  }
}
