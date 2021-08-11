
import 'package:fayrbase4/models/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mainPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Login Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // Email
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  onSaved: (e) {
                    email = e;
                  },
                  validator: (text) {
                    if (text!.length < 6) {
                      return "Kamida 6 ta belgi kerak";
                    }
                  },
                ),
              ),
              // Password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  obscureText: true,
                  onSaved: (p) {
                    password = p;
                  },
                  validator: (text) {
                    if (text!.length < 6) {
                      return "Kamida 6 ta belgi kerak";
                    }
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text("Email SignIn"),
                onPressed: _emailSignIn,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: Text("Forgot Password !"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Forgot_password_oage())),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text("Google Auth !"),
                onPressed: _googleSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _emailSignIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        FocusScope.of(context).unfocus();
        User _signInQilganUser = (await _authUser.signInWithEmailAndPassword(
            email: email!, password: password!))
            .user!;

        print("User Tizimga Kirdi: ${_signInQilganUser.email}");
        if (_signInQilganUser.emailVerified) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Emailni Tekshirib Qaytadan Urinib Ko'ring !"),
            ),
          );
        }
      }
    } catch (e) {
      print("XATO: " + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Email yoki Password Xato !"),
        ),
      );
    }
  }

  void _signOut() async {
    if (_authUser.currentUser != null) {
      await _authUser.signOut();
    } else {
      print("Shundoqham User Yo'q !");
    }
  }

  _googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser!.authentication;

    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}