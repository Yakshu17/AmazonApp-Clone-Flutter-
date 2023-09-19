import 'package:amazon_clone/Screens/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyDH4CofJg5wpL-AtJufk4RsKr-knMs5DXw",
        authDomain: "clone-flutter-462c1.firebaseapp.com",
        projectId: "clone-flutter-462c1",
        storageBucket: "clone-flutter-462c1.appspot.com",
        messagingSenderId: "72415188722",
        appId: "1:72415188722:web:e14be2eff0902dd32da26b"));
  }
  else{
  await Firebase.initializeApp();}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

