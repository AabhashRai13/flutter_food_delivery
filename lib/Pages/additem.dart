import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/entry_field.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/repositories/product_repository.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  AddItemState createState() => AddItemState();
}

class AddItemState extends State<AddItem> {
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
            "Add Listings",
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rulesController = TextEditingController();
  final TextEditingController _rentalForController = TextEditingController();
  final TextEditingController _rentalDurationController =
      TextEditingController();

  int? foodType = -1;
  int? haveApp = -1;
  GlobalKey<FormState> signupKey = GlobalKey();
  // ignore: prefer_typing_uninitialized_variables
  late String? userId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  getUserId() async {
    // ignore: await_only_futures
    userId = await FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: signupKey,
          child: ListView(
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
                        'Listing Image',
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
                      // AppLocalizations.of(context)!.info!,
                      'Listing Info',
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
                      hint:
                          // AppLocalizations.of(context)!.enterTitle,
                          'Listing Name',
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Listing Name is required';
                        } else {
                          return null;
                        }
                      },
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
                      hint: 'Listing Category',
                      controller: _categoryController,
                      // AppLocalizations.of(context)!.selectCategory,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Listing Category is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      // label: "ITEM PRICE",
                      hint: "Rental Price",
                      controller: _priceController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Rental Price is required';
                        } else {
                          return null;
                        }
                      },
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "WAIVER REQUIRED AT PICKUP",
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
                            "Yes",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      const SizedBox(
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
                      "TYPE OF RENTAL",
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
                            "Hourly",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      const SizedBox(
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
                            "Daily",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      const SizedBox(
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
                            value: 2,
                          ),
                          Text(
                            "Weekly",
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
                      "LISTING DESCRIPTION",
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
                      controller: _descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Description is required';
                        } else {
                          return null;
                        }
                      },
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
                      "ADDITIONAL RENTING RULES",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: EntryField(
                      hint: "Add Rules",
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
                      "LISTING VIDEO",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5),
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
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          hint: "Rental For",
                          controller: _rentalForController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Rental purpose required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        EntryField(
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          hint: "Rental Duration",
                          controller: _rentalDurationController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Rental purpose required';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            text: AppLocalizations.of(context)!.editt,
            onTap: () async {
              if (signupKey.currentState!.validate()) {
                signupKey.currentState!.save();

                bool success = await ProductRepository().addProducts(
                  userId: userId ?? '',
                  description: _descriptionController.text.trim(),
                  listingCategory: _categoryController.text.trim(),
                  listingName: _nameController.text.trim(),
                  rentalDuration: _rentalDurationController.text.trim(),
                  rentalFor: _rentalForController.text.trim(),
                  rentalPrice: double.parse(_priceController.text),
                  pickup: foodType,
                  typeOfRental: haveApp,
                  rentingRules: _rulesController.text.trim(),
                );

                if (success == true) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        )
      ],
    );
  }
}
