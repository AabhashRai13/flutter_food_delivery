import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/entry_field.dart';
import 'package:hungerz_store/Components/textfield.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool inStock = false;

  @override
  Widget build(BuildContext context) {
    String? stock = AppLocalizations.of(context)!.outStock;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.add!,
            style: Theme.of(context).textTheme.bodyText1),
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
        actions: [
          Center(
            child: Text(
              '$stock',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: kHintColor),
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
              if (inStock == true)
                stock = AppLocalizations.of(context)!.stock;
              else if (inStock == false)
                stock = AppLocalizations.of(context)!.outStock;
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
  int? foodType = -1;
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
                      AppLocalizations.of(context)!.image!.toUpperCase(),
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
                        child: Image.asset('images/placeholder_dish.png'),
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
                    AppLocalizations.of(context)!.info!,
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
                    // initialValue: AppLocalizations.of(context).sandwich,
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
                    // initialValue: AppLocalizations.of(context).fast,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: EntryField(
                    textCapitalization: TextCapitalization.words,
                    // label: "ITEM PRICE",
                    hint: "Enter Item Price",
                    // initialValue: "\$5.00",
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
                        child: SmallTextFormField("OPTION TITLE", "Add Option"
                            // initialValue: 'Extra Cheese',
                            ),
                      ),
                      Expanded(
                        child: SmallTextFormFieldR("PRICE", "Price"
                            // initialValue: 'Extra Cheese',
                            ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 12.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: EntryField(
                //           textCapitalization: TextCapitalization.words,
                //           // label: AppLocalizations.of(context).price,
                //           hint: AppLocalizations.of(context).enterPrice,
                //           initialValue: 'Extra Mayonnaise',
                //         ),
                //       ),
                //       Expanded(
                //         child: EntryField(
                //           textCapitalization: TextCapitalization.words,
                //           // label: AppLocalizations.of(context).quantity,
                //           hint: AppLocalizations.of(context).enterQuantity,
                //           initialValue: '\$ 2.00',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
                    hint: "Add Description",
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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: EntryField(
                    hint: "Add Ingredients",
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
                      ),
                      EntryField(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        hint: "Cooking time",
                      ),
                      EntryField(
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        hint: "Energy (in kcal)",
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
