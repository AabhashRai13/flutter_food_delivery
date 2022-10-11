import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  String? stock = "Out of Stock";

  bool inStock = false;

  List<DropdownMenuItem<int>> listDrop = [];
  int? selected;

  void loadData() {
    listDrop = [];
    listDrop.add(DropdownMenuItem(
      child: Text('0.25 kg'),
      value: 1,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text('0.5 kg'),
      value: 2,
    ));
    listDrop.add(DropdownMenuItem(
      child: Text('1 kg'),
      value: 3,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: AppLocalizations.of(context)!.fast),
      Tab(text: AppLocalizations.of(context)!.stater!.toUpperCase()),
      Tab(text: AppLocalizations.of(context)!.mainCourse!.toUpperCase()),
      Tab(text: AppLocalizations.of(context)!.desert!.toUpperCase()),
    ];
    loadData();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(
            titleWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Text(
                  // AppLocalizations.of(context)!.product!,
                  "My Listings",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
              ],
            ),
            // actions: <Widget>[
            //   IconButton(
            //       icon: Icon(Icons.search),
            //       onPressed: () {
            //         // CustomSearchBar(hint: 'Search item');
            //       }),
            // ],
            bottom: TabBar(
              tabs: tabs,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              isScrollable: true,
              labelColor: kMainColor,
              unselectedLabelColor: kLightTextColor,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 24.0),
            ),
          ),
        ),
        body: TabBarView(
          children: tabs.map((Tab tab) {
            return ListView(
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 6.3,
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/2.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.sandwich!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 3.50',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = "Available";
                                  // AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock = "Not Available";
                                  // AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/4.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.chicken!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_nonveg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 7.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/5.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.burger!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 5.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/c.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.csandwich!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 4.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/3.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.frankie!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 6.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/4.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.chicken!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_nonveg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 7.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/5.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.burger!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 5.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.editItem),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/3.png',
                              scale: 1.6,
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(AppLocalizations.of(context)!.frankie!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/ic_veg.png',
                                        height: 16.0,
                                        width: 16.7,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text('\$ 6.00',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.directional(
                          end: 0.0,
                          bottom: 8.0,
                          textDirection: Directionality.of(context),
                          child: Row(
                            children: [
                              Text(
                                '$stock',
                                style: TextStyle(
                                    color: kHintColor,
                                    fontSize: 13.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                activeColor: kMainColor,
                                activeTrackColor: Colors.grey[200],
                                value: inStock,
                                onChanged: (value) {
                                  setState(() {
                                    inStock = value;
                                  });
                                  if (inStock == true)
                                    stock = AppLocalizations.of(context)!.stock;
                                  else if (inStock == false)
                                    stock =
                                        AppLocalizations.of(context)!.outStock;
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kMainColor,
          onPressed: () => Navigator.pushNamed(context, PageRoutes.addItem),
          tooltip: AppLocalizations.of(context)!.add,
          child: Icon(
            Icons.add,
            size: 27,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
