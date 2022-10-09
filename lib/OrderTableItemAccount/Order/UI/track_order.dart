import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Components/entry_field.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_bloc.dart';
import 'package:hungerz_store/OrderMapBloc/order_map_state.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';
import 'package:hungerz_store/map_utils.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: TrackOrderBody(),
    );
  }
}

class TrackOrderBody extends StatefulWidget {
  @override
  _TrackOrderBodyState createState() => _TrackOrderBodyState();
}

class _TrackOrderBodyState extends State<TrackOrderBody> {
  bool chatOpen = false;
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
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(105.0),
          child: CustomAppBar(
            leading: IconButton(
              icon: Hero(
                tag: 'arrow',
                child: Icon(Icons.keyboard_arrow_down),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Hero(
                tag: 'Delivery Boy',
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  // padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 22.0,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
                    title: Text(
                      'George Anderson',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.deliveryPartner!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: <Widget>[
                          // IconButton(
                          //   icon: Icon(
                          //     chatOpen ? Icons.close : Icons.message,
                          //     color: kMainColor,
                          //     size: 18.0,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       if (chatOpen)
                          //         chatOpen = false;
                          //       else
                          //         chatOpen = true;
                          //     });
                          //   },
                          // ),
                          IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: kMainColor,
                              size: 20.0,
                            ),
                            onPressed: () {
                              /*.......*/
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: chatOpen
          ? Stack(
              children: [
                Opacity(
                  opacity: 0.08,
                  child: BlocBuilder<OrderMapBloc, OrderMapState>(
                      builder: (context, state) {
                    print('polyyyy' + state.polylines.toString());
                    return GoogleMap(
                      polylines: state.polylines,
                      mapType: MapType.normal,
                      initialCameraPosition: kGooglePlex,
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) async {
                        _mapController.complete(controller);
                        mapStyleController = controller;
                        mapStyleController!.setMapStyle(mapStyle);
                        setState(() {
                          _markers.add(
                            Marker(
                              markerId: MarkerId('mark1'),
                              position:
                                  LatLng(37.42796133580664, -122.085749655962),
                              icon: markerss.first,
                            ),
                          );
                          _markers.add(
                            Marker(
                              markerId: MarkerId('mark2'),
                              position:
                                  LatLng(37.42496133180663, -122.081743655960),
                              icon: markerss[0],
                            ),
                          );
                        });
                      },
                    );
                  }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    MessageStream(),
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: EntryField(
                        controller: _messageController,
                        hint: AppLocalizations.of(context)!.enterMessage,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: kMainColor,
                          ),
                          onPressed: () {
                            _messageController.clear();
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    105,
                child: Stack(children: [
                  BlocBuilder<OrderMapBloc, OrderMapState>(
                      builder: (context, state) {
                        print('polyyyy' + state.polylines.toString());
                        return GoogleMap(
                          polylines: state.polylines,
                          mapType: MapType.normal,
                          initialCameraPosition: kGooglePlex,
                          markers: _markers,
                          onMapCreated: (GoogleMapController controller) async {
                            _mapController.complete(controller);
                            mapStyleController = controller;
                            mapStyleController!.setMapStyle(mapStyle);
                            setState(() {
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('mark1'),
                                  position:
                                  LatLng(37.42796133580664, -122.085749655962),
                                  icon: markerss.first,
                                ),
                              );
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('mark2'),
                                  position:
                                  LatLng(37.42496133180663, -122.081743655960),
                                  icon: markerss[0],
                                ),
                              );
                            });
                          },
                        );
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.only(left: 12.0, right: 12, top: 10),
                      child: EntryField(
                        controller: _messageController,
                        hint: AppLocalizations.of(context)!.enterMessage,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: kMainColor,
                            size: 25,
                          ),
                          onPressed: () {
                            _messageController.clear();
                            setState(() {
                              chatOpen = !chatOpen;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MessageBubble> messageBubbles = [
      MessageBubble(
        sender: 'user',
        text: AppLocalizations.of(context)!.heyThere,
        time: '11:58 am',
        isDelivered: false,
        isMe: true,
      ),
      MessageBubble(
        sender: 'delivery_partner',
        text: AppLocalizations.of(context)!.onMyWay,
        time: '11:59 am',
        isDelivered: false,
        isMe: false,
      ),
    ];
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messageBubbles,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? sender;
  final String? time;
  final bool? isDelivered;

  MessageBubble(
      {this.sender, this.text, this.time, this.isMe, this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 4.0,
            color:
                isMe! ? kMainColor : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(6.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    text!,
                    textAlign: isMe! ? TextAlign.right : TextAlign.left,
                    style: isMe!
                        ? bottomBarTextStyle
                        : Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 15.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: isMe!
                              ? kWhiteColor.withOpacity(0.75)
                              : kLightTextColor,
                        ),
                      ),
                      // isMe
                      //     ? Icon(
                      //         Icons.check_circle,
                      //         color: isDelivered ? Colors.blue : kDisabledColor,
                      //         size: 12.0,
                      //       )
                      //     : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
