import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'booking_data.dart';

class BookingsPage extends StatefulWidget {
  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  List names = [
    "Samantha Smith",
    "Emili Williamson",
    "Lisa Devis",
    "Samayra Patel",
    "Operum Williamson",
    "George Williamson"
  ];
  List ocassion = [
    "Birthday Party",
    "Aniversary",
    "For Date",
    "Birthday Party",
    "Aniversary",
    "For Date"
  ];

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      Tab(text: "New Bookings".toUpperCase()),
      Tab(text: "Past Bookings".toUpperCase()),
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
                "Table Booking",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: TabBar(
                  tabs: tabs,
                  isScrollable: true,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  labelColor: kMainColor,
                  indicatorColor: kMainColor,
                  unselectedLabelColor: kLightTextColor,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 24.0),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Bookings(),
              Bookings(),
            ],
          )),
    );
  }
}
