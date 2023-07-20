import 'package:trash_picker/Authentification/Auth_Admin/login_Admin.dart';
import 'package:trash_picker/Authentification/Auth_Agent/Login_Agent.dart';
import 'package:trash_picker/Theme/menu_item.dart';
import 'package:trash_picker/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:trash_picker/Responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            width: 50,
          ),
          const SizedBox(width: 10),
          if (!isDesktop(context))
            Text(
              'Smart Garbage Collection',
              style: GoogleFonts.alef(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.bold,
                //  fontWeight: FontWeight.bold,
                color: const Color.fromARGB(218, 0, 0, 0),
              ),
            ),
          if (isDesktop(context))
            Text(
              'Smart Garbage Collection',
              style: GoogleFonts.alef(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //  fontWeight: FontWeight.bold,
                color: const Color.fromARGB(218, 0, 0, 0),
              ),
            ),
          const Spacer(),
          if (isDesktop(context))
            Row(
              children: [
                NavItem(
                  title: 'Welcome',
                  tapEvent: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                ),
                NavItem(
                  title: 'Agent Space',
                  tapEvent: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginAgent()));
                  },
                ),
                NavItem(
                  title: 'Administration',
                  tapEvent: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginAdmin()));
                  },
                ),
                NavItem(
                  title: 'in regards to',
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
    );
  }
}
