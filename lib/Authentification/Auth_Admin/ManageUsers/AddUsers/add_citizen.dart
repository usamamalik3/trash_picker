// ignore_for_file: unused_import, file_names, deprecated_member_use, unnecessary_new, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trash_picker/Authentification/Auth_Admin/ManageUsers/manageUser.dart';
import 'package:trash_picker/Authentification/Auth_citizen/login_citizen.dart';
import 'package:trash_picker/UsersInfo/user_model.dart';

import 'package:trash_picker/mpas/maps/Maps.dart';
import 'package:trash_picker/screens/SocialPage.dart';

import 'package:trash_picker/screens/animation.dart';
import 'package:trash_picker/Theme/header_widget.dart';
import 'package:trash_picker/Theme/theme_helper.dart';
////////////////
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Theme/menu_item.dart';

import '../../../../screens/welcome_page.dart';
import '../../../Auth_Agent/Login_Agent.dart';

class AddCitizen extends StatefulWidget {
  const AddCitizen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddCitizenState();
  }
}

class _AddCitizenState extends State<AddCitizen> {
  final _formKey = GlobalKey<FormState>();
  static final List<String> items = <String>[
    'Sidi massoud',
    'Centre Medina',
    'Hiboun',
    'Zahraa'
  ];
//! firebase!!!!!!!!
  final TextEditingController _confirmPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  String? dropdownValue;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
//! firebase!!!!!!!!
  bool checkedValue = false;
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
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
              Icons.keyboard_return,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ManageUser()));
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
      ////////////////////////////////////////////////

      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),

                                ///icon user !!!!!!!!!!!!!!!!!
                                child: const Icon(
                                  Icons.admin_panel_settings,
                                  color: Color.fromARGB(255, 159, 158, 158),
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Ajouter Citizens',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //!name!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Last name and First name", "Enter Last name"),
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter your First and Last Name !";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _nameController.text = val!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //!email !!!!!!!!!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your e-mail"),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (val) {
                              if (val!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address !";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _emailController.text = val!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        //!password!!!!!!!!!!!!!!!!!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            //controller: _pass,
                            decoration: ThemeHelper().textInputDecoration(
                                "Confirm your PasswordEnter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Confirm your PasswordEnter your password !";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _passwordController.text = val!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        //!confirm password!!!!!!!!!!!!!!!!!!!!!!!
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          child: TextFormField(
                            obscureText: true,
                            controller: _confirmPass,
                            decoration: ThemeHelper().textInputDecoration(
                                "Confirm your Password",
                                "Confirm your PasswordEnter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "récrire votre password !";
                              }
                              if (val != _passwordController.text) {
                                return "don't match !";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        //! dropdown_list
                        Container(
                          margin: EdgeInsets.only(left: w / 4, right: w / 4),
                          // margin: EdgeInsets.only(left: w / 5, right: w / 5),
                          //width: 260,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 253, 253, 253)
                                    .withOpacity(0.5),
                                blurRadius: 20,
                                offset: const Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: const Color.fromARGB(255, 89, 89, 89),
                                width: 1),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              hint: const Text(
                                'Entrer votre emplacement',
                              ),
                              isExpanded: true,
                              iconSize: 30,
                              icon: const Icon(Icons.arrow_drop_down_sharp,
                                  color: Color.fromARGB(255, 26, 26, 26)),
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (val) => setState(
                                () {
                                  val = val;
                                  dropdownValue = val;
                                },
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Veuillez sélectionner un emplacement';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 20.0),
                        ////////////////////////////////bottom login !!!!!!!!!!!!!
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUp(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,

        child: Text(
          item,
          style: const TextStyle(
            //fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 98, 98, 98),
          ),
        ), // Text
      ); // DropdownMenuItem
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            )
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Successful connection"),
                  postDetailsToFirestore(),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginCitizen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
         case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "The user with this email does not exist.";
            break;
          case "user-disabled":
            errorMessage = "The user with this email has been deactivated.";
            break;
          case "too-many-requests":
            errorMessage = "too many requests";
            break;
          case "operation-not-allowed":
            errorMessage =
                "Login with email and password is not enabled.";
            break;
          default:
            errorMessage = "An undefined error has occurred.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = _nameController.text;
    userModel.password = _passwordController.text;
    userModel.localisation = dropdownValue;

    await firebaseFirestore
        .collection("Citizens")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: " Compte créer avec succès:) ");
  }
}
