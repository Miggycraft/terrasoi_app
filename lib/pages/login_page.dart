import 'package:flutter/material.dart';
import 'package:terrasoi/util/verify_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // variables
  Verification v = Verification();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  void verifyAccount() {
    if (v.isValid(_username.text, _password.text)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      var t = SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Invalid Username/Password!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  'assets/terrasoi_logo.jpg',
                ),
                height: 250.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontWeight: FontWeight.w600,
                    fontSize: 65.0,
                    color: Color.fromRGBO(4, 50, 28, 1)),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25.0,
                  ),
                  Image.asset(
                    'assets/icons/person_icon.png',
                    width: 40,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 250.0,
                    child: TextField(
                      controller: _username,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25.0,
                  ),
                  Image.asset(
                    'assets/icons/lock_icon.png',
                    width: 40,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 250.0,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '. . . . . . . .',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: 50,
                  // ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 65.0),
                            backgroundColor: Color.fromRGBO(155, 231, 157, 1),
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            verifyAccount();
                          },
                          child: Text('Log in')),
                      Text(
                        'Forgot your Password?',
                        style: TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 90.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Don\'t have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        decorationColor: Colors.blue,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
