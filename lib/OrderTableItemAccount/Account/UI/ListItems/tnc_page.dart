import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungerz_store/Locale/locales.dart';

class TncPage extends StatelessWidget {
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
        title: Text(AppLocalizations.of(context)!.tnc!,
            style: Theme.of(context).textTheme.bodyText1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(48.0),
                color: Theme.of(context).cardColor,
                child: SvgPicture.asset("images/renterii_text.svg",
                    width: MediaQuery.of(context).size.width * 0.6,
                    semanticsLabel: 'Acme Logo'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.termsOfUse!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar porta sagittis. Sed id varius magna. Etiam felis neque, gravida vitae elementum non, consequat eu odio. Mauris cursus commodo nisi sed imperdiet. Fusce vitae vehicula ipsum, ut commodo lorem. Praesent interdum blandit condimentum. Curabitur vel orci vitae odio congue facilisis eget eget diam.\n\nNam a arcu efficitur, ornare leo eu, euismod leo. Vestibulum porttitor varius leo, eget posuere felis congue vel. Sed sit amet erat quam. Mauris et ex sapien. Sed venenatis, felis sed eleifend vulputate, mauris libero pretium urna, non hendrerit urna quam vitae justo. Maecenas rhoncus lectus consectetur eros pretium feugiat.\n',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      AppLocalizations.of(context)!.companyPolicy!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pulvinar porta sagittis. Sed id varius magna. Etiam felis neque, gravida vitae elementum non, consequat eu odio. Mauris cursus commodo nisi sed imperdiet. Fusce vitae vehicula ipsum, ut commodo lorem. Praesent interdum blandit condimentum. Curabitur vel orci vitae odio congue facilisis eget eget diam.\n\nNam a arcu efficitur, ornare leo eu, euismod leo. Vestibulum porttitor varius leo, eget posuere felis congue vel. Sed sit amet erat quam. Mauris et ex sapien. Sed venenatis, felis sed eleifend vulputate, mauris libero pretium urna, non hendrerit urna quam vitae justo. Maecenas rhoncus lectus consectetur eros pretium feugiat.\n',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
