// ignore_for_file: camel_case_types, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text("welcom"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: email,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: password,
          ),
          Divider(
            height: 5,
            thickness: 3,
          ),
          TextButton(
              onPressed: () async {
                try {
                  var credential = FirebaseAuth.instance;
                  UserCredential myUser =
                      await credential.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          content: Center(
                            child: Text("not valide$e"),
                          ),
                        );
                      }));
                }
              },
              child: Text("signup")),
          SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () async {
                try {
                  var credential = FirebaseAuth.instance;
                  UserCredential myUser =
                      await credential.signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          content: Center(
                            child: Text("not valide email or password"),
                          ),
                        );
                      }));
                }
              },
              child: Text("login"))
        ],
      ),
    );
  }
}
