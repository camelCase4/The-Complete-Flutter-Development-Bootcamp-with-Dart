import 'package:flashchat_app/inpucredential.dart';
import 'package:flashchat_app/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/lightning.png'),
                      ),
                    ),
                    const Text(
                      "FlashChat",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const LoginButton(),
            const RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: StadiumBorder(),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const RegistrationPage();
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (context) {
          return Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const InputCredentialPage();
                      },
                    ),
                  );
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
