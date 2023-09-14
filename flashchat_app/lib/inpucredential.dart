import 'package:flashchat_app/maindashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class InputCredentialPage extends StatefulWidget {
  const InputCredentialPage({super.key});

  @override
  State<InputCredentialPage> createState() => _InputCredentialPageState();
}

class _InputCredentialPageState extends State<InputCredentialPage> {
  String emailEntered = "";
  String passEntered = "";
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/lightning.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    emailEntered = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                child: TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    passEntered = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final currentClient =
                          await _auth.signInWithEmailAndPassword(
                              email: emailEntered, password: passEntered);
                      if (currentClient != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const HomeDashboard();
                          }),
                        );
                      }
                      else
                      {
                        print("You do not exist in our database");
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print("You do not exist in our database");
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
