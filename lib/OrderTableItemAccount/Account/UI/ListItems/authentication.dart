import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Themes/colors.dart';

class AuthenticationList extends StatelessWidget {
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
        title: Text(
          "Authentication",
          style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 70),
            children: <Widget>[
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
                      "KITCHEN APP",
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
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
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
                      "KIOSK APP",
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
                        SmallTextFormField(null, null, null, "+1 987 654 3210"),
                        SmallTextFormField(null, null, null, "+1 987 654 3210"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
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
                      "eMENU APP",
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
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
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
                      "REVIEW APP",
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
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
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
                      "DESK APP",
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
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                          SmallTextFormField(
                              null, null, null, "+1 987 654 3210"),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
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
