import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/Themes/style.dart';

class AddToBank extends StatelessWidget {
  const AddToBank({super.key, required this.totalAmount});
  final double totalAmount;
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
      body: Add(totalAmount: totalAmount),
    );
  }
}

class Add extends StatelessWidget {
  const Add({super.key, required this.totalAmount});
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!
                              .availableBalance!
                              .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  letterSpacing: 0.67,
                                  color: kHintColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '\$ $totalAmount',
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
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                    label: AppLocalizations.of(context)!
                        .accountHolderName!
                        .toUpperCase(),
                    title: null,
                    icon: null,
                    initial: 'Food Junction',
                  ),
                  SmallTextFormField(
                    label:
                        AppLocalizations.of(context)!.bankName!.toUpperCase(),
                    title: null,
                    icon: null,
                    initial: 'HBNC Bank of New York',
                  ),
                  SmallTextFormField(
                    label: 'Branch code'.toUpperCase(),
                    title: null,
                    icon: null,
                    initial: 'Food Junction',
                  ),
                  SmallTextFormField(
                    label: 'Account Number'.toUpperCase(),
                    title: null,
                    icon: null,
                    initial: 'Food Junction',
                  ),
                  SmallTextFormField(
                    label: 'Enter Amount to transfer'.toUpperCase(),
                    title: null,
                    icon: null,
                    initial: 'Food Junction',
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            const SizedBox(
              height: 80,
            ),
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
