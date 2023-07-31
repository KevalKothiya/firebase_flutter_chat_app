import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_chat_app/helpers/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
           Map<String, dynamic> data = await FBAHelper.fbaHelper.anonymous();
           if (data['user'] != null) {
             Get.snackbar(
               "Success",
               "Sing in Successfull...",
               backgroundColor: Colors.green,
               snackPosition: SnackPosition.BOTTOM,
               duration: const Duration(seconds: 1),
             );
             User? user = data['user'];
             Get.offAndToNamed('/', arguments: user);
           } else {
             Get.snackbar(
               "Failed",
               data['msg'],
               backgroundColor: Colors.redAccent,
               snackPosition: SnackPosition.BOTTOM,
               duration: const Duration(seconds: 1),
             );
           }
          },
          child: Text("Anonymous User"),
        ),
      ),
    );
  }
}
