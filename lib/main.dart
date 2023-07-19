// ignore_for_file: constant_identifier_names, avoid_print, prefer_const_constructors, empty_catches, use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member, deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter/material.dart';
import 'package:trash_picker/screens/welcome_page.dart';

import 'Authentification/Auth_Admin/GererUsers/ConsulterUser/ConsulterCitoyen.dart';
import 'Authentification/Auth_Admin/GererUsers/ConsulterUser/ConsulterPoubelle.dart';
import 'Authentification/Auth_Admin/GererUsers/ConsulterUser/consulterPanne.dart';
import 'Authentification/Auth_Agent/Dashboard_Agent.dart';
import 'mpas/ORServisesMaps.dart';
import 'mpas/OpenRouteServices.dart';

const d_red = Color.fromARGB(239, 16, 191, 4);

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    print("widgets initialized");
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDkYfReC9iSBLx7HqTwrfLcKiBkN1mhc7E",
          authDomain: "trashpicker-bb2d7.firebaseapp.com",
          projectId: "trashpicker-bb2d7",
          storageBucket: "trashpicker-bb2d7.appspot.com",
          messagingSenderId: "834599004692",
          appId: "1:834599004692:web:789f0e37fdfe064d28d501"),
    );
  } catch (e) {}
  print("fire base initialized");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  final Color _primaryColor = Color.fromARGB(255, 0, 42, 47); //#028900
  Color kPrimaryColor = Color.fromARGB(239, 16, 191, 4);
  Color kSecondaryColor = Color(0XFFFFC906);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartGarbages',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: _primaryColor),
      ),
      home: WelcomePage(),
    );
  }
}
