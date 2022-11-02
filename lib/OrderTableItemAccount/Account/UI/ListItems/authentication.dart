import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthenticationList extends StatelessWidget {
  const AuthenticationList({super.key});

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Add Insurance",
          style: TextStyle(
              fontSize: 16.7, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(bottom: 70),
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "Items + Lodging (Canada)",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: const [
                          SmallTextFormField(initial: "+1 987 654 3210"),
                        ],
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.renterii.com/comfort');
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('+ ADD NOW'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kMainColor,
                                fontSize: 10,
                                letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "Items + Lodging (USA)",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        SmallTextFormField(initial: "+1 987 654 3210"),
                        SmallTextFormField(initial: "+1 987 654 3210"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.renterii.com/usa');
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('+ ADD MORE'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kMainColor,
                                fontSize: 10,
                                letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "Items + Lodging (International)",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SmallTextFormField(initial: "+1 987 654 3210"),
                          SmallTextFormField(initial: "+1 987 654 3210"),
                          SmallTextFormField(initial: "+1 987 654 3210"),
                          SmallTextFormField(initial: "+1 987 654 3210"),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.renterii.com/world');
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('+ ADD MORE'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kMainColor,
                                fontSize: 10,
                                letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
                text: "Save",
                onTap: () {
                  // Navigator.pushNamed(context, PageRoutes.accountPage);
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
