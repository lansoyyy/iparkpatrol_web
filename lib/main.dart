import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iparkpatrol_web/screens/home_screen.dart';
import 'package:iparkpatrol_web/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBbq64pq_JWLxmduqRdaGAvbqbGyx9QFws",
          authDomain: "iparkpatrol.firebaseapp.com",
          projectId: "iparkpatrol",
          storageBucket: "iparkpatrol.appspot.com",
          messagingSenderId: "362008413359",
          appId: "1:362008413359:web:dead73fc4883059bec005a"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
