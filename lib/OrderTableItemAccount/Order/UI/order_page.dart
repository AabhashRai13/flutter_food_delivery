import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: AppLocalizations.of(context)!.newOrder),
      Tab(text: AppLocalizations.of(context)!.pastOrder),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!.orderText!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
                labelColor: kMainColor,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                indicatorColor: kMainColor,
                unselectedLabelColor: kLightTextColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 24.0),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: tabs.map((Tab tab) {
            return ListView(
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 8.0,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PageRoutes.orderInfoPage),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Samantha Smith',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  fontSize: 13.3,
                                                  letterSpacing: 0.07),
                                        ),
                                        Spacer(),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .pending!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Color(0xffffa025),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.7,
                                                    letterSpacing: 0.06)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Order AE5587 | 22 June, 11:35 am',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$ 21.00 | COD',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Veg Sandwich x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                                Text(
                                  '(Extra Cheese)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontSize: 11.7,
                                          letterSpacing: 0.06,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Fried Chicken x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('WaterMelon Juice x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 8.0,
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Row(
                          children: [
                            Text("Delivery",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                            Spacer(),
                            Text("1:20",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PageRoutes.orderInfoPage),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'George Taylor',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  fontSize: 13.3,
                                                  letterSpacing: 0.07),
                                        ),
                                        Spacer(),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .pending!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Color(0xffffa025),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.7,
                                                    letterSpacing: 0.06)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Order DG2414 | 22 June, 11:20 am',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$ 11.50 | Wallet',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Veg Sandwich x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                                Text(
                                  '(Extra Cheese)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontSize: 11.7,
                                          letterSpacing: 0.06,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Fried Chicken x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('WaterMelon Juice x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 8.0,
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Row(
                          children: [
                            Text("Takeaway",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                            Spacer(),
                            Text("3:58",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PageRoutes.orderInfoPage),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Peterson George',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  fontSize: 13.3,
                                                  letterSpacing: 0.07),
                                        ),
                                        Spacer(),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .accepted!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Color(0xff7ac81e),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.7,
                                                    letterSpacing: 0.06)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Order BD1255 | 22 June, 11:20 am',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$ 11.50 | COD',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Veg Sandwich x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                                Text(
                                  '(Extra Cheese)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontSize: 11.7,
                                          letterSpacing: 0.06,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('WaterMelon Juice x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 8.0,
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Row(
                          children: [
                            Text("Delivery",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                            Spacer(),
                            Text("19:20",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PageRoutes.orderInfoPage),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Jessica Amenda',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                  fontSize: 13.3,
                                                  letterSpacing: 0.07),
                                        ),
                                        Spacer(),
                                        Text(
                                            AppLocalizations.of(context)!
                                                .accepted!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Color(0xff7ac81e),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.7,
                                                    letterSpacing: 0.06)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Order BD1255 | 22 June, 11:20 am',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$ 20.50 | Credit Card',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontSize: 11.7,
                                                  letterSpacing: 0.06,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Veg Sandwich x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                                Text(
                                  '(Extra Cheese)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontSize: 11.7,
                                          letterSpacing: 0.06,
                                          fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('Fried Chicken x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text('WaterMelon Juice x1',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            fontSize: 11.7,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.06,
                                            color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Divider(
                            color: Theme.of(context).cardColor,
                            thickness: 8.0,
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Row(
                          children: [
                            Text("Takeaway",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                            Spacer(),
                            Text("1:59",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontSize: 11.7,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
