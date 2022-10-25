// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'mobile_input.dart';

//first page that takes phone number as input for verification
class PhoneNumber extends StatefulWidget {
  static const String id = 'phone_number';
  final VoidCallback? onVerificationDone;

  const PhoneNumber({this.onVerificationDone, super.key});

  @override
  PhoneNumberState createState() => PhoneNumberState();
}

class PhoneNumberState extends State<PhoneNumber> {
  @override
  void initState() {
    super.initState();
    _checkForBuyNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //used for scrolling when keyboard pops up
        child: Container(
          color: Theme.of(context).cardColor,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.7,
                child: SvgPicture.asset("images/renterii_text.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
                width: MediaQuery.of(context).size.width * 0.5,
                child: SvgPicture.asset("images/for_lenders_text.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SvgPicture.asset("images/cycle.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              const Spacer(),
              Container(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "images/renterii_banner.svg",
                        semanticsLabel: 'Acme Logo',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0, top: 15.0),
                                  child: Image.asset('images/rental_icon.png'),
                                )),
                            Flexible(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Image.asset('images/make_money.png'),
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                child: MobileInput(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkForBuyNow() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // if (!sharedPreferences.containsKey("key_buy_this_shown") &&
    //     AppConfig.isDemoMode) {
    //   Future.delayed(Duration(seconds: 10), () async {
    //     if (mounted) {
    //       BuyThisApp.showSubscribeDialog(context);
    //       sharedPreferences.setBool("key_buy_this_shown", true);
    //     }
    //   });
    // }
  }
}
