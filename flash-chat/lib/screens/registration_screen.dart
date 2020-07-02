import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import '../constants.dart';
import 'chat_screen.dart';
import 'package:flash_chat/services/login_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static LoginService _login = LoginService();
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Builder(
                builder: (context) => RoundedButton(
                  color: Colors.blueAccent,
                  buttonText: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _login.registerWithEmail(
                          email: email.trim() ?? '', password: password);
                      if (newUser != null) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, ChatScreen.id, (_) => false);
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    } catch (e) {
                      // print(e);
                      SnackBar snackBar = SnackBar(
                        content: Text('$e'),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                ),
              ),
              RoundedButton(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue with '),
                    Container(
                      height: 25.0,
                      child: Image.asset('images/google-logo.png'),
                    ),
                  ],
                ),
                onPressed: () async {
                  try {
                    final newUser = await _login.signInWithGoogle();
                    if (newUser != null) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, ChatScreen.id, (_) => false);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
