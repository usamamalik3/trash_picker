// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable, unused_element, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trash_picker/Authentification/Auth_Admin/Dashboard_Admin.dart';
import 'package:trash_picker/Authentification/Auth_Admin/ManageUsers/AddUsers/addDriver.dart';

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
import '../../../Auth_Agent/Login_Agent.dart';

import '../manageUser.dart';
import '../Update User/updateCitizen.dart';

class ConsultDriver extends StatefulWidget {
  const ConsultDriver({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConsultDriverState();
  }
}

List<Object> _ListUser = [];

class _ConsultDriverState extends State<ConsultDriver> {
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
                          builder: (context) => const ManageUser()));
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
            stream:
                FirebaseFirestore.instance.collection('Driver').snapshots(),
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
                        Icons.person,
                        size: 50,
                      ),
                      iconColor: const Color.fromARGB(255, 0, 0, 0),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //!update!!!!!
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultDriver()));
                            },
                            icon: const Icon(Icons.file_upload_outlined),
                            iconSize: 40,
                            color: const Color.fromARGB(255, 14, 167, 1),
                          ),
                          //!Dellete
                          IconButton(
                            onPressed: () async {
                              final collection = FirebaseFirestore.instance
                                  .collection('Driver');
                              collection
                                      .doc(document
                                          .id) // <-- Doc ID to be deleted.
                                      .delete() // <-- Delete
                                  ;
                            },
                            icon: const Icon(Icons.delete),
                            iconSize: 40,
                            color: Colors.red,
                          )
                        ],
                      ),
                      title: Text(
                        " name & Préname :  ${data['name']} \n Email :  ${data['email']} \n password :  ${data['password']}   \n Téléphone :  ${data['tel']}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
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
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  " Ajouter un Chauffeur ".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddDriver()));
              },
            ),
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
