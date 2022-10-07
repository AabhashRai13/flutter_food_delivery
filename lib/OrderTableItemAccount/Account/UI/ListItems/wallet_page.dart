import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.wallet!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
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
      ),
      body: Wallet(),
    );
  }
}

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 5),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.availableBalance!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        letterSpacing: 0.67,
                        color: kHintColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '\$ 758.50',
                    style: listTitleTextStyle.copyWith(
                        fontSize: 35.0,
                        color: kMainTextColor,
                        letterSpacing: 0.18),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              alignment: Alignment.bottomLeft,
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Theme.of(context).cardColor,
              child: Text(
                AppLocalizations.of(context)!.recent!,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.08),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 46.0,
                width: 134.0,
                decoration: BoxDecoration(
                    color: kMainColor, borderRadius: BorderRadius.circular(3)),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, PageRoutes.addToBank),
                  child: Text(
                    AppLocalizations.of(context)!.sendToBank!,
                    style: bottomBarTextStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 212217',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('3 items | 30 June 2018, 11.59 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$80.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.online!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$5.20',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232313',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('2 items | 30 June 2018, 10.23 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$110.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.online!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$9.50',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.sendToBank!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('29 June 2018, 09.12 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '-\$100.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.sendToBank!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232323',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('3 items | 20 June 2018, 10.43 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$150.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.cash!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$7.50',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232373',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('2 items | 10 June 2018, 11.23 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$140.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.cash!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$9.80',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232983',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('2 items | 10 June 2018, 10.43 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$170.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.cash!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$7.10',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232983',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('Delivered 3 items',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$210.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.cash!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$12.50',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232393',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('3 items | 22 June 2018, 11.33 am',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$140.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.online!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$9.50',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Order num 232783',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.0),
                  Text('Delivered 3 items',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$190.00',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.cash!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$11.50',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(AppLocalizations.of(context)!.earnings!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: kTextColor, fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 3.0,
        ),
      ],
    );
  }
}
