import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_picker/mpas/maps/global.dart';
import 'package:trash_picker/screens/welcome_page.dart';

import '../../screens/SocialPage.dart';

class MyDrawer extends StatefulWidget {
  String? nom;
  String? email;

  MyDrawer({this.nom, this.email});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
              0.0,
              1.0
            ],
                colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            ])),
        child: ListView(
          children: [
            //drawer header
            Container(
              height: 165,
              color: Colors.grey,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: ListView(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 12.0,
            ),

            //drawer body
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white54,
                ),
                title: Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SocialPage()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  color: Colors.white54,
                ),
                title: Text(
                  "Social screen",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomePage()));
                });
              },
              child: const ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white54,
                ),
                title: Text(
                  "Sign out",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
