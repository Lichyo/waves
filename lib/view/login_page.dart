import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waves/view/home_page.dart';
import 'package:waves/view/registration_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'enter your email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'enter your password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Color(0xFF86B6F6),
                    borderRadius: BorderRadius.circular(50),
                    shadowColor: Colors.blue.shade500,
                    elevation: 3,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width*1,
                      height: 55,
                      onPressed: () async {
                        try {
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          _auth.setPersistence(Persistence.LOCAL);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text(
                        'login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Don't have any account?"),
                  const SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Color(0xFF86B6F6),
                    borderRadius: BorderRadius.circular(50),
                    shadowColor: Colors.blue.shade500,
                    elevation: 3,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width*1,
                      height: 55,
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      child: Text(
                        'registration',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
