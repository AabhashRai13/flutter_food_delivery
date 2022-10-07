import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_bloc.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_state.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/map_utils.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: SetLocation(),
    );
  }
}

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  TextEditingController _messageController = TextEditingController();
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('images/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleWidget: Text(
            AppLocalizations.of(context)!.setLocation!,
            style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
          ),
          onTap: null,
          hint: AppLocalizations.of(context)!.enterLocation,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                BlocBuilder<OrderMapBloc, OrderMapState>(
                    builder: (context, state) {
                  print('polyyyy' + state.polylines.toString());
                  return GoogleMap(
                    // polylines: state.polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: kGooglePlex,
                    // markers: _markers,
                    onMapCreated: (GoogleMapController controller) async {
                      _mapController.complete(controller);
                      mapStyleController = controller;
                      mapStyleController!.setMapStyle(mapStyle);
                    },
                  );
                }),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kCardBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/map_pin.png',
                  scale: 2.5,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    "1124, Veggy Garden, City Food Park, United States",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
            text: AppLocalizations.of(context)!.continueText,
            onTap: () =>
                Navigator.popAndPushNamed(context, PageRoutes.storeProfile),
          ),
        ],
      ),
    );
  }
}
