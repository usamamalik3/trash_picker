// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable, unused_element, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trash_picker/Authentification/Auth_Admin/dashboard_Admin.dart';
import 'package:trash_picker/Authentification/Auth_Admin/ManageUsers/AddUsers/add_citizen.dart';

import 'package:trash_picker/mpas/maps/Maps.dart';
import 'package:trash_picker/screens/socialPage.dart';

import 'package:trash_picker/screens/animation.dart';
import 'package:trash_picker/Theme/header_widget.dart';
import 'package:trash_picker/Theme/theme_helper.dart';
////////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Theme/menu_item.dart';
import '../../../../screens/welcome_page.dart';
import '../../../Auth_Agent/login_Agent.dart';


import '../manageUser.dart';
import '../Update User/updateCitizen.dart';

class ConsultTrashcan extends StatefulWidget {
  const ConsultTrashcan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConsultTrashcanState();
  }
}

List<Object> _ListUser = [];

class _ConsultTrashcanState extends State<ConsultTrashcan> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.secondary,
                  ])),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.keyboard_return_rounded,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileAdmin()));
                },
              ),
              const Spacer(),
              Row(
                children: [
                  NavItem(
                    title: 'Espace Agent',
                    tapEvent: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginAgent()));
                    },
                  ),
                ],
              ),
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('data').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (snapshots.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SafeArea(
                child: ListView(
                  children: snapshots.data!.docs
                      .toList()
                      .map<Widget>((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return new ListTile(
                      leading: const Icon(
                        Icons.restore_from_trash_rounded,
                        size: 40,
                      ),
                      iconColor: Color.fromARGB(255, 11, 114, 0),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //!update!!!!!
                          IconButton(
                            // onPressed: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const UpdateCitoyen()));
                            // },

                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConsultTrashcan()),
                              );
                            },

                            icon: const Icon(Icons.add_location_outlined),
                            iconSize: 30,
                            color: const Color.fromARGB(255, 14, 167, 1),
                          ),
                          //!Dellete
                        ],
                      ),
                      title: Text(
                        " name Poubelle:  ${data['name']} \n Longitude:  ${data['Longitude']} \n Latitude:  ${data['Latitude']} \n Pourcentage:  ${data['pourcentage']} % \n Etat :  ${data['etat']}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontFamily: "OoohBaby",
                            fontStyle: FontStyle.normal,
                            fontSize: 20),
                      ),
                      minVerticalPadding: 12,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
