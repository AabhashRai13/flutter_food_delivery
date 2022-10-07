import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Themes/colors.dart';

import 'package:hungerz_store/Locale/locales.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

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
                padding: EdgeInsets.symmetric(vertical: 48.0),
                color: Theme.of(context).cardColor,
                child: Image(
                  image: AssetImage("images/logo_restro.png"), //delivoo logo
                  height: 130.0,
                  width: 99.7,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 16.0),
                      child: Text(
                        AppLocalizations.of(context)!.orWrite!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                      child: Text(
                        AppLocalizations.of(context)!.yourWords!,
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
                            'images/icons/ic_phone.png',
                          ),
                          inputField(
                            AppLocalizations.of(context)!.message!,
                            "Enter your message here",
                            'images/icons/ic_mail.png',
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
                SmallTextFormField(null, hint),
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
