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
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset("images/renterii_text.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
                width: MediaQuery.of(context).size.width * 0.6,
                child: SvgPicture.asset("images/for_lenders_text.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset("images/cycle.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.19,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset("images/renterii_banner.svg",
                    semanticsLabel: 'Acme Logo'),
              ),
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
