import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/entry_field.dart';
import 'package:hungerz_store/Components/textfield.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';

class EditItem extends StatefulWidget {
  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  bool inStock = false;
  String? stock = "Not Available";

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
        title: Text(
            // AppLocalizations.of(context)!.edit!,
            "Edit Listings",
            style: Theme.of(context).textTheme.bodyText1),
        actions: [
          Center(
            child: Text(
              '$stock',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: inStock ? kMainColor : kHintColor),
            ),
          ),
          Switch(
            activeColor: kMainColor,
            activeTrackColor: Colors.grey[200],
            value: inStock,
            onChanged: (value) {
              setState(() {
                inStock = value;
              });
              if (inStock == true) {
                stock = "Available";
              } else if (inStock == false) {
                stock = "Not Available";
              }
            },
          )
        ],
      ),
      body: Add(),
    );
  }
}

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  int? foodType = 0;
  int? haveApp = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(bottom: 70),
          children: <Widget>[
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 6.7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Listing Image",
                      // AppLocalizations.of(context)!.image!.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 99.0,
                        width: 99.0,
                        child: Image.asset('images/2.png'),
                      ),
                      SizedBox(width: 24.0),
                      Icon(
                        Icons.camera_alt,
                        color: kMainColor,
                        size: 25.0,
                      ),
                      SizedBox(width: 14.3),
                      Text(AppLocalizations.of(context)!.uploadPhoto!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: kMainColor)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    // AppLocalizations.of(context)!.info!,
                    "Listing Info",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: EntryField(
                    textCapitalization: TextCapitalization.words,
                    // label: AppLocalizations.of(context).title,
                    hint: AppLocalizations.of(context)!.enterTitle,
                    initialValue: AppLocalizations.of(context)!.sandwich,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: EntryField(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    textCapitalization: TextCapitalization.words,
                    // label: AppLocalizations.of(context).itemCategory,
                    hint: AppLocalizations.of(context)!.selectCategory,
                    initialValue: "Fast Food",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: EntryField(
                    textCapitalization: TextCapitalization.words,
                    // label: "ITEM PRICE",
                    hint: "Item Price",
                    initialValue: "\$5.00",
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "FOOD TYPE",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          groupValue: foodType,
                          onChanged: (dynamic value) {
                            setState(() {
                              foodType = value;
                            });
                          },
                          activeColor: kMainColor,
                          value: 0,
                        ),
                        Text(
                          "Veg",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Radio(
                          groupValue: foodType,
                          onChanged: (dynamic value) {
                            setState(() {
                              foodType = value;
                            });
                          },
                          activeColor: kMainColor,
                          value: 1,
                        ),
                        Text(
                          "Non Veg",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!.price!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SmallTextFormField(
                          "OPTION TITLE",
                          AppLocalizations.of(context)!.enterPrice,
                          null,
                          'Extra Cheese',
                        ),
                      ),
                      Expanded(
                        child: SmallTextFormFieldR(
                          "PRICE",
                          AppLocalizations.of(context)!.enterQuantity,
                          null,
                          '\$ 3.00',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: EntryField(
                          textCapitalization: TextCapitalization.words,
                          // label: AppLocalizations.of(context).price,
                          hint: AppLocalizations.of(context)!.enterPrice,
                          initialValue: 'Extra Mayonnaise',
                        ),
                      ),
                      Expanded(
                        child: EntryFieldR(
                          textCapitalization: TextCapitalization.words,
                          // label: AppLocalizations.of(context).quantity,
                          hint: AppLocalizations.of(context)!.enterQuantity,
                          initialValue: '\$ 2.00',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('+ add More'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                            fontSize: 10,
                            letterSpacing: 0.5)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "DO YOU HAVE eMENU APP?",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          groupValue: haveApp,
                          onChanged: (dynamic value) {
                            setState(() {
                              haveApp = value;
                            });
                          },
                          activeColor: kMainColor,
                          value: 0,
                        ),
                        Text(
                          "Yes",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Radio(
                          groupValue: haveApp,
                          onChanged: (dynamic value) {
                            setState(() {
                              haveApp = value;
                            });
                          },
                          activeColor: kMainColor,
                          value: 1,
                        ),
                        Text(
                          "No",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "ITEM DESCRIPTION",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: EntryField(
                    maxLength: 5,
                    maxLines: 5,
                    hint: "Add Description",
                    initialValue:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "INGREDIENTS",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Flour",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              child: Image(
                                image: AssetImage("images/ic_cancel.png"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sugar",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              child: Image(
                                image: AssetImage("images/ic_cancel.png"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Baking Powder",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              child: Image(
                                image: AssetImage("images/ic_cancel.png"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Salt",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              child: Image(
                                image: AssetImage("images/ic_cancel.png"),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('+ add More'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                            fontSize: 10,
                            letterSpacing: 0.5)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "ITEM VIDEO",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.upload_sharp,
                        color: kMainColor,
                      ),
                      Text(
                        "Upload Video",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: kMainColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "MORE INFO",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.67,
                        color: kHintColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      EntryField(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        hint: "Servings for",
                        initialValue: "2 Pople Serving",
                      ),
                      EntryField(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        hint: "Cooking time",
                        initialValue: "12 min",
                      ),
                      EntryField(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        hint: "Energy (in kcal)",
                        initialValue: "227 (kcal)",
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            text: AppLocalizations.of(context)!.editt,
            onTap: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
