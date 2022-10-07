import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';

class AddToBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.sendToBank!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
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
      ),
      body: Add(),
    );
  }
}

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!
                              .availableBalance!
                              .toUpperCase(),
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                              letterSpacing: 0.67,
                              color: kHintColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\$ 558.50',
                        style: listTitleTextStyle.copyWith(
                            fontSize: 35.0,
                            color: kMainTextColor,
                            letterSpacing: 0.18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 13),
                    child: Text(
                      AppLocalizations.of(context)!.bankInfo!.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  SmallTextFormField(
                    AppLocalizations.of(context)!
                        .accountHolderName!
                        .toUpperCase(),
                    null,
                    null,
                    'Food Junction',
                  ),
                  SmallTextFormField(
                    AppLocalizations.of(context)!.bankName!.toUpperCase(),
                    null,
                    null,
                    'HBNC Bank of New York',
                  ),
                  SmallTextFormField(
                    AppLocalizations.of(context)!.branchCode!.toUpperCase(),
                    null,
                    null,
                    '+1 987 654 3210',
                  ),
                  SmallTextFormField(
                    AppLocalizations.of(context)!.accountNumber!.toUpperCase(),
                    null,
                    null,
                    '4321 4567 6789 8901',
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: SmallTextFormField(
                AppLocalizations.of(context)!
                    .enterAmountToTransfer!
                    .toUpperCase(),
                null,
                null,
                '\$ 500',
              ),
            ),
            SizedBox(height: 80,),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            text: AppLocalizations.of(context)!.sendToBank,
            onTap: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
