import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';

class InsightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.insight!,
            style: Theme.of(context).textTheme.bodyText1),
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
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.today!.toUpperCase(),
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                    color: Theme.of(context).primaryColor),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  /*....*/
                },
              )
            ],
          )
        ],
      ),
      body: Insight(),
    );
  }
}

class Insight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 10),
      children: <Widget>[
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10),
          child: Row(
            children: <Widget>[
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '32',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    'Rental Orders',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '229',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    'Items + Spaces Rented',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '\$494.50',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.earnings!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 6.7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.earnings!.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 15.0, letterSpacing: 1.5)),
              const Center(
                child: Image(
                  image: AssetImage("images/graph.png"),
                  height: 200.0,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.walletPage),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.viewAll!.toUpperCase(),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: kMainColor,
                        letterSpacing: 1.33,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 6.7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top 5 Rented Items',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).secondaryHeaderColor,
                      letterSpacing: 0.77,
                      fontSize: 18)),
              const SizedBox(
                height: 5,
              ),
              Text('Total 112 rentals',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              const Image(
                image: AssetImage("images/2.png"),
                height: 61.3,
                width: 61.3,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.sandwich!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Text('188 ' + AppLocalizations.of(context)!.sales!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              const Image(
                image: AssetImage("images/4.png"),
                height: 61.3,
                width: 61.3,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.chicken!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Text('179 ' + AppLocalizations.of(context)!.sales!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              const Image(
                image: AssetImage("images/5.png"),
                height: 61.3,
                width: 61.3,
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.burger!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Text('154 ' + AppLocalizations.of(context)!.sales!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              const Image(
                image: AssetImage("images/4.png"),
                height: 61.3,
                width: 61.3,
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.chicken!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text('179 ' + AppLocalizations.of(context)!.sales!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage("images/5.png"),
                height: 61.3,
                width: 61.3,
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.burger!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.0),
                  Text('154 ' + AppLocalizations.of(context)!.sales!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 11.7)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
