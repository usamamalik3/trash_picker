import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_picker/Theme/theme_provider.dart';
import 'package:trash_picker/Widgets/change_theme_button_widget.dart';


class TestTheme extends StatefulWidget {
  const TestTheme({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _TestThemeState createState() => _TestThemeState();
}

class _TestThemeState extends State<TestTheme> {
  @override
  Widget build(BuildContext context) {
    final themeText =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
            ? 'Light Theme'
            : 'Dark Theme';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(
                  'Text with a background color',
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
              ),
              ChangeThemeButtonWidget(),
              Text(
                "App Theme $themeText",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "displayLarge",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "displayMedium",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "displaySmall",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "headlineMedium",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "headlineSmall",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                ".titleLarge!",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              Text(
                "bodyLarge",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "bodyMedium",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/logos/trashpick_logo_curved.png',
                scale: 5.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/logos/trashpick_logo_round.png',
                scale: 5.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/logos/trashpick_logo_square.png',
                scale: 5.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "PrimaryColor - Green",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                "SecondaryColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).backgroundColor,
              ),
              Text(
                "AccentColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                "RedColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: AppThemeData().redColor,
              ),
              Text(
                "BlueColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: AppThemeData().blueColor,
              ),
              Text(
                "YellowColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: AppThemeData().yellowColor,
              ),
              Text(
                "WhiteColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: AppThemeData().whiteColor,
              ),
              Text(
                "GreyColor",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: AppThemeData().greyColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
