import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_chat_app/firebase_options.dart';
import 'package:firebase_flutter_chat_app/screens/home_page.dart';
import 'package:firebase_flutter_chat_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      initialRoute: '/login_page',
      getPages: [
        GetPage(name: '/', page: () => const HomePage(),),
        GetPage(name: '/login_page', page: () => const LoginPage(),),
      ],
    )
  );
}