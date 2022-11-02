import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Themes/colors.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

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
        title: Text(AppLocalizations.of(context)!.support!,
            style: Theme.of(context).textTheme.bodyText1),
      ),
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width / 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 48.0, horizontal: 40),
                color: Theme.of(context).cardColor,
                child: SvgPicture.asset("images/renterii_text.svg",
                    width: MediaQuery.of(context).size.width * 0.6,
                    semanticsLabel: 'Acme Logo'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                      child: Text(
                        'Needing some help?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
                      child: Text(
                        'Send us a message or chat with us',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          inputField(
                            AppLocalizations.of(context)!.mobileNumber!,
                            '+1 987 654 3210',
                            'images/icons/mobile.png',
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://www.renterii.com/chat');
                            },
                            child: inputField(
                              AppLocalizations.of(context)!.message!,
                              "Enter your message here",
                              'images/icons/message.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: BottomBar(
              text: AppLocalizations.of(context)!.submit,
              onTap: () {
                /*............*/
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container inputField(String title, String hint, String img) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20,
                child: Image(
                  image: AssetImage(
                    img,
                  ),
                  color: kMainColor,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Text(title,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12))
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                SmallTextFormField(title: hint),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
