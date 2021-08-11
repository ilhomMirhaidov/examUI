
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          "Sign Up Page",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (text) {
                    if (text!.length < 6) {
                      return "Kamida 6 ta belgi kerak";
                    }
                  },
                ),
              ),
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
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: Text("Email SignUp"),
                onPressed: _emailSignUp,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: Text("Sign In Sahifasiga O't"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage())),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.tealAccent),
                child: Text("Sms Orqali Ro'yhatdan O't"),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SmsPage())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _emailSignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential _credential = await _authUser
            .createUserWithEmailAndPassword(email: email!, password: password!);

        User _newUser = _credential.user!;
        await _newUser.sendEmailVerification();
        if (_authUser.currentUser != null) {
          await _authUser.signOut();
          await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
        print(_newUser.email);
      } catch (e) {
        print("XATO: " + e.toString());
      }
    }
  }
}