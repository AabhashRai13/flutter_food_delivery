import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Maps/UI/network_utils.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_bloc.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_state.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/map_utils.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key, this.textEditingController});

  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: SetLocation(
        textEditingController: textEditingController,
      ),
    );
  }
}

class SetLocation extends StatefulWidget {
  const SetLocation({super.key, this.textEditingController});

  final TextEditingController? textEditingController;
  @override
  SetLocationState createState() => SetLocationState();
}

class SetLocationState extends State<SetLocation> {
  final TextEditingController _messageController = TextEditingController();
  String googleApikey = "GOOGLE_MAP_API_KEY";
  GoogleMapController? mapStyleController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.6602292, 85.308027);
  String location = "Set Address";

  void placeAutoComplete(String query) async {
    Uri uri = Uri.https(
        "maps.google.com", "maps/api/place/autocomplete/json", //unencoder path
        {
          "input": query, //query parameter
          "key": apiKey, // make sure you add your api key
        });
    String? response = await NetworkUtils.fetchUrl(uri);
    if (response != null) {
      log(response);
    }
  }

  @override
  void initState() {
    rootBundle.loadString('images/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  void dispose() {
    mapStyleController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(126.0),
        child: CustomAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleWidget: Text(
            AppLocalizations.of(context)!.setLocation!,
            style: const TextStyle(
                fontSize: 16.7,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          onTap: null,
          hint: AppLocalizations.of(context)!.enterLocation,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                BlocBuilder<OrderMapBloc, OrderMapState>(
                    builder: (context, state) {
                  log('polyyyy${state.polylines}');

                  return GoogleMap(
                    //Map widget from google_maps_flutter package
                    mapType: MapType.normal,
                    initialCameraPosition: kGooglePlex,
                    onMapCreated: (controller) {
                      //method called when map is created
                      setState(() {
                        mapStyleController = controller;
                      });
                    },
                    onCameraMove: (CameraPosition cameraPositiona) {
                      cameraPosition = cameraPositiona; //when map is dragging
                    },
                    onCameraIdle: () async {
                      //when map drag stops
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                              cameraPosition!.target.latitude,
                              cameraPosition!.target.longitude);
                      setState(() {
                        //get place name from lat and lang
                        location =
                            "${placemarks.first.street.toString()},${placemarks.first.subLocality.toString()},${placemarks.first.subAdministrativeArea.toString()},${placemarks.first.administrativeArea.toString()}";
                        Future.delayed(const Duration(milliseconds: 500), () {
                          // Do something

                          widget.textEditingController!.text = location;
                        });
                      });
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
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/map_pin.png',
                  scale: 2.5,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
              text: AppLocalizations.of(context)!.continueText,
              onTap: () async {
                Map latLongMap = {
                  "lat": cameraPosition!.target.latitude,
                  "long": cameraPosition!.target.longitude
                };
                Navigator.pop(context, latLongMap);
              }),
        ],
      ),
    );
  }
}
