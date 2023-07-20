// ignore_for_file: file_names, deprecated_member_use, unnecessary_string_escapes, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trash_picker/Authentification/Auth_Agent/dashboard_Agent.dart';
import 'package:trash_picker/Authentification/Auth_Agent/SignUp_Agent.dart';
import 'package:trash_picker/Responsive/responsive.dart';
import 'package:trash_picker/Theme/menu_item.dart';
import 'package:trash_picker/Theme/header_widget.dart';
import 'package:trash_picker/Theme/theme_helper.dart';
import 'package:trash_picker/screens/welcome_page.dart';
//import 'package:app_projet_pfe/Pages/SocialPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Auth_Admin/Login_Admin.dart';
import '../resetPassword.dart';

class LoginAgent extends StatefulWidget {
  const LoginAgent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginAgentState();
  }
}

class _LoginAgentState extends State<LoginAgent> {
  final _formKey = GlobalKey<FormState>();
  final double _headerHeight = 210;
//!forebase !!!
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? errorMessage;
//! end forebase !!!
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    const styles = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.white,
      ////////////////////////////////////////////////
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
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
          ),
          const Spacer(),
          Row(
            children: [
              NavItem(
                title: 'Admin areaistrateur',
                tapEvent: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginAdmin()));
                },
              ),
            ],
          ),
        ],
      ),
//////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.account_circle), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Espace Agent',
                        style: GoogleFonts.alef(
                          textStyle: styles,
                          //  fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(218, 23, 23, 23),
                        ),
                      ),
                      const Text(
                        'Connectez-vous à votre compte',
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 133, 133)),
                      ),
                      const SizedBox(height: 25.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              //! Email descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!/////
                              if (isDesktop(context))
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 3.5, right: w / 3.5),
                                  // alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre adresse e-mail"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Enter a valid email address !";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              const SizedBox(height: 20.0),
                              //! password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                              if (isDesktop(context))
                                Container(
                                  margin: EdgeInsets.only(
                                      left: w / 3.5, right: w / 3.5),
                                  child: TextFormField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: _passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('password',
                                            'Confirm your PasswordEnter your password'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Confirm your PasswordEnter your password";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              if (isDesktop(context))
                                // const SizedBox(height: 20.0),
                                //! forgot password descktop !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//////
                                if (isDesktop(context))
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 20),
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ResetPassword()),
                                        );
                                      },
                                      child: const Text(
                                        "password oublié?",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 133, 133, 133),
                                        ),
                                      ),
                                    ),
                                  ),

                              //! !!!!!!!!!!!!!!!!!!!phone
                              //! Email phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("Adresse e-mail",
                                            "Entrer votre e-mail"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val) {
                                      if (val!.isEmpty ||
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              // const SizedBox(height: 20.0),
                              //! password phone !!!!!!!!!!!!!!!!!!!!!!
                              if (!isDesktop(context))
                                Container(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('password',
                                            'Confirm your PasswordEnter your password'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Confirm your PasswordEnter your password";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              //! forgot password phone !!!!!!!!!!!!!!!!!!!!!!
                              const SizedBox(height: 15.0),
                              if (!isDesktop(context))
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()),
                                      );
                                    },
                                    child: const Text(
                                      "password oublié?",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                      ),
                                    ),
                                  ),
                                ),
                              //! Bottom signin !!!!!!!!!!!!!!!!
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      " connection ".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      debugPrint(
                                          'Toutes les validations sont passées !!');
                                    }
                                    signIn(_emailController.text,
                                        _passwordController.text);
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Vous n'avez pas de compte ? "),
                                  TextSpan(
                                    text: 'Créer',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationAgent()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Successful connection"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProfileAgent())),
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
}
