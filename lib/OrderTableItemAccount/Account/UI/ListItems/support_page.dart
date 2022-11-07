import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Themes/colors.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  GlobalKey<FormState> signupKey = GlobalKey();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(AppLocalizations.of(context)!.support!,
            style: Theme.of(context).textTheme.bodyText1),
      ),
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width / 2,
                padding:
                    const EdgeInsets.symmetric(vertical: 48.0, horizontal: 40),
                color: Theme.of(context).cardColor,
                child: SvgPicture.asset("images/renterii_text.svg",
                    width: MediaQuery.of(context).size.width * 0.6,
                    semanticsLabel: 'Acme Logo'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                      child: Text(
                        'Needing some help?',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
                      child: Text(
                        'Send us a message or chat with us',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: signupKey,
                        child: Column(
                          children: [
                            inputField(
                                title:
                                    AppLocalizations.of(context)!.mobileNumber!,
                                hint: '+1 987 654 3210',
                                img: 'images/icons/mobile.png',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Mobile Number is required';
                                  } else if (value.isValidNumber()) {
                                    return 'Please enter valid number';
                                  }
                                  {
                                    return null;
                                  }
                                },
                                controller: _numberController),
                            inputField(
                                title: AppLocalizations.of(context)!.message!,
                                hint: "Enter your message here",
                                img: 'images/icons/message.png',
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return 'Message is empty';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _messageController),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: BottomBar(
              text: AppLocalizations.of(context)!.submit,
              onTap: () {
                if (signupKey.currentState!.validate()) {
                  signupKey.currentState!.save();
                  'hello@renterii.com'.sendMail(
                      body:
                          "Respected sir/Madam,\n\n \nPhone Number - ${_numberController.text}\n\n\n ${_messageController.text}\n\nRegards,\n ",
                      subject: 'Message about the application');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container inputField(
      {String? title,
      String? hint,
      String? img,
      String? Function(String?)? validator,
      required TextEditingController controller}) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 20,
                child: Image(
                  image: AssetImage(
                    img ?? '',
                  ),
                  color: kMainColor,
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Text(title ?? '',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12))
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                SmallTextFormField(
                  title: hint,
                  validator: validator,
                  textEditingController: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
