import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/entry_field.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Pages/video_page.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/constants_utils.dart';
import 'package:hungerz_store/data/local/prefs.dart';
import 'package:hungerz_store/extension.dart';
import 'package:hungerz_store/bloc/products/products_cubit.dart';
import 'package:hungerz_store/models/product_id.dart';
import 'package:hungerz_store/repositories/product_repository.dart';
import 'package:image_picker/image_picker.dart';

class AddItem extends StatefulWidget {
  const AddItem(
      {super.key,
      required this.isEditing,
      this.productId,
      required this.productCubit});
  final bool isEditing;
  final ProductId? productId;
  final ProductCubit productCubit;
  @override
  AddItemState createState() => AddItemState();
}

class AddItemState extends State<AddItem> {
  @override
  void initState() {
    super.initState();
    inStock = widget.productId!.product.inStock ?? false;
    if (inStock == true) {
      stock = "Available";
    } else if (inStock == false) {
      stock = "Not Available";
    }
  }

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
            widget.isEditing ? "Edit Listings" : "Add Listings",
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
      body: Add(
        isEditing: widget.isEditing,
        productId: widget.productId,
        productCubit: widget.productCubit,
        inStock: inStock,
      ),
    );
  }
}

class Add extends StatefulWidget {
  const Add(
      {super.key,
      required this.isEditing,
      this.productId,
      required this.productCubit,
      required this.inStock});
  final bool isEditing;
  final ProductId? productId;
  final ProductCubit productCubit;
  final bool inStock;

  @override
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _rulesController = TextEditingController();
  TextEditingController _rentalForController = TextEditingController();
  TextEditingController _rentalDurationController = TextEditingController();
  var imageUrl = '';
  File? image;
  var videoUrl = '';
  int? pickup = -1;
  int? typeOfRental = -1;
  GlobalKey<FormState> signupKey = GlobalKey();
  // ignore: prefer_typing_uninitialized_variables
  late String? userId = "";
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void initState() {
    super.initState();
    getUserId();
    widget.isEditing ? initializeController() : null;
  }

  getUserId() async {
    userId = await _appPreferences.getUserID();
  }

  Future<String> pickFromCamera() async {
    var downloadUrl = '';
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    var file = File(pickedFile!.path);
    image = file;
    setState(() {});
    if (pickedFile != null) {
      final snapshot = await FirebaseStorage.instance
          .ref()
          .child(pickedFile.name)
          .putFile(file)
          .whenComplete(() {});
      downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      debugPrint('No image selected.');
    }
    return downloadUrl;
  }

  Future<String> pickFromGallery() async {
    var downloadUrl = '';
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    var file = File(pickedFile!.path);
    image = file;
    setState(() {});
    if (pickedFile != null) {
      final snapshot = await FirebaseStorage.instance
          .ref()
          .child(pickedFile.name)
          .putFile(file)
          .whenComplete(() {});
      downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      debugPrint('No image selected.');
    }
    return downloadUrl;
  }

  var _choosenCategory = '';
  var rentalFor = '';
  var rentalDuration = '';
  var initialCategory = "";
  var initialrentalFor = "";
  var initalRentalDuration = "";
  bool loading = false;
  initializeController() {
    if (widget.isEditing == true) {
      _nameController =
          TextEditingController(text: widget.productId!.product.listingName);
      _categoryController = TextEditingController(
          text: widget.productId!.product.listingCategory);
      initialCategory = widget.productId!.product.listingCategory ?? '';
      imageUrl = widget.productId!.product.imageUrl ?? '';
      initialrentalFor = widget.productId!.product.rentalFor ?? '';
      initalRentalDuration = widget.productId!.product.rentalDuration ?? '';
      _descriptionController =
          TextEditingController(text: widget.productId!.product.description);
      _priceController = TextEditingController(
          text: widget.productId!.product.rentalPrice.toString());
      pickup = widget.productId!.product.pickup;
      typeOfRental = widget.productId!.product.typeOfRental;
      _rulesController =
          TextEditingController(text: widget.productId!.product.rentingRules);
      _rentalForController =
          TextEditingController(text: widget.productId!.product.rentalFor);
      _rentalDurationController =
          TextEditingController(text: widget.productId!.product.rentalDuration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: signupKey,
          child: ListView(
            padding: const EdgeInsets.only(bottom: 70),
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 6.7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Rental Image',
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
                        SizedBox(
                          height: 99.0,
                          width: 99.0,
                          child: image != null
                              ? Image.file(image!)
                              : (widget.isEditing && imageUrl.trim().isNotEmpty
                                  ? Image.network(imageUrl)
                                  : Image.asset('images/image_icon.png')),
                        ),
                        const SizedBox(width: 24.0),
                        Icon(
                          Icons.camera_alt,
                          color: kMainColor,
                          size: 25.0,
                        ),
                        const SizedBox(width: 14.3),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: const Text("Make a Choice"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title:
                                              const Text('Pick From Gallery'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            imageUrl = await pickFromGallery();
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Take a Picture'),
                                          onTap: () async {
                                            Navigator.pop(context);
                                            imageUrl = await pickFromCamera();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                              AppLocalizations.of(context)!.uploadPhoto!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: kMainColor)),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "RENTAL VIDEO",
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
                        GestureDetector(
                          onTap: () async {
                            videoUrl = await Navigator.push(
                              context,
                              // Create the SelectionScreen in the next step.
                              MaterialPageRoute(
                                  builder: (context) => const VideoUpload()),
                            );
                          },
                          child: Text(
                            "Upload Video",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: kMainColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      // AppLocalizations.of(context)!.info!,
                      'Rental Info',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: EntryField(
                      textCapitalization: TextCapitalization.words,
                      hint:
                          // AppLocalizations.of(context)!.enterTitle,
                          'Rental Name',
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
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          isDense: true,
                          prefixStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black, fontSize: 12),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                        hint: Text(initialCategory == ""
                            ? "Rental Category"
                            : initialCategory),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black, fontSize: 15),
                        value: _choosenCategory.isNotEmpty
                            ? _choosenCategory
                            : null,
                        validator: ((value) {
                          if (_choosenCategory.trim().isEmpty) {
                            return 'Please select category';
                          } else {
                            return null;
                          }
                        }),
                        items: listingCategory.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          _choosenCategory = value!;
                          _categoryController.text = _choosenCategory;
                          log(_choosenCategory);
                        }),
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
                      "TYPE OF RENTAL",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  Wrap(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            groupValue: typeOfRental,
                            onChanged: (dynamic value) {
                              setState(() {
                                typeOfRental = value;
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            groupValue: typeOfRental,
                            onChanged: (dynamic value) {
                              setState(() {
                                typeOfRental = value;
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            groupValue: typeOfRental,
                            onChanged: (dynamic value) {
                              setState(() {
                                typeOfRental = value;
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            groupValue: typeOfRental,
                            onChanged: (dynamic value) {
                              setState(() {
                                typeOfRental = value;
                              });
                            },
                            activeColor: kMainColor,
                            value: 3,
                          ),
                          Text(
                            "Monthly",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 4.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      prefixStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black, fontSize: 12),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    hint: Text(
                      initalRentalDuration == ""
                          ? "Rental Duration"
                          : initalRentalDuration,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black, fontSize: 15),
                    value: rentalDuration.isNotEmpty ? rentalDuration : null,
                    validator: ((value) {
                      if (rentalDuration.trim().isEmpty) {
                        return 'Please select Rental Duration';
                      } else {
                        return null;
                      }
                    }),
                    items: rentalDurationsList.map((rentDur) {
                      return DropdownMenuItem<String>(
                        value: rentDur,
                        child: Text(rentDur),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      rentalDuration = value!;
                      _rentalDurationController.text = rentalDuration;
                      log(rentalDuration);
                    }),
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            prefixStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black, fontSize: 12),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                          ),
                          hint: Text(
                            initialrentalFor == ""
                                ? "Rental For"
                                : initialrentalFor,
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black, fontSize: 15),
                          value: rentalFor.isNotEmpty ? rentalFor : null,
                          validator: ((value) {
                            if (rentalFor.trim().isEmpty) {
                              return 'Please select Rental For';
                            } else {
                              return null;
                            }
                          }),
                          items: rentalForCategoryList.map((rentFor) {
                            return DropdownMenuItem<String>(
                              value: rentFor,
                              child: Text(rentFor),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            rentalFor = value!;
                            _rentalForController.text = rentalFor;
                            log(rentalFor);
                          }),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 4.0,
                color: Theme.of(context).cardColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
              Divider(
                thickness: 8.0,
                color: Theme.of(context).cardColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      "RENTAL DESCRIPTION",
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
                  const SizedBox(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
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
                      controller: _rulesController,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('+ add More'.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                              fontSize: 10,
                              letterSpacing: 0.5)),
                    ),
                  ),
                  const SizedBox(
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
                            groupValue: pickup,
                            onChanged: (dynamic value) {
                              setState(() {
                                pickup = value;
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
                            groupValue: pickup,
                            onChanged: (dynamic value) {
                              setState(() {
                                pickup = value;
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
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
            text: loading
                ? "Loading.."
                : widget.isEditing
                    ? 'Update Listing'
                    : 'Add Listing',
            onTap: loading
                ? () {}
                : () async {
                    loading = true;
                    if (signupKey.currentState!.validate()) {
                      signupKey.currentState!.save();
                      if (pickup == -1) {
                        context.showFailureSnack(
                            'Please select waiver required at pick up');
                      } else if (typeOfRental == -1) {
                        context.showFailureSnack('Please select Rental Type');
                      } else {
                        if (widget.isEditing == false) {
                          bool success = await ProductRepository().addProducts(
                              userId: userId ?? '',
                              description: _descriptionController.text.trim(),
                              listingCategory: _categoryController.text.trim(),
                              listingName: _nameController.text.trim(),
                              rentalDuration:
                                  _rentalDurationController.text.trim(),
                              rentalFor: _rentalForController.text.trim(),
                              rentalPrice: double.parse(_priceController.text),
                              pickup: pickup,
                              typeOfRental: typeOfRental,
                              rentingRules: _rulesController.text.trim(),
                              imageUrl: imageUrl,
                              videoUrl: videoUrl,
                              inStock: widget.inStock);
                          if (success == true) {
                            await widget.productCubit.getAllProducts();

                            if (!mounted) return;
                            context.showSuccessSnack("Item added successfully");

                            Navigator.of(context).pop();
                          }
                        } else if (widget.isEditing == true) {
                          bool success = await ProductRepository().editProducts(
                              userId: userId ?? '',
                              description: _descriptionController.text.trim(),
                              listingCategory: _categoryController.text.trim(),
                              listingName: _nameController.text.trim(),
                              rentalDuration:
                                  _rentalDurationController.text.trim(),
                              rentalFor: _rentalForController.text.trim(),
                              rentalPrice: double.parse(_priceController.text),
                              pickup: pickup,
                              typeOfRental: typeOfRental,
                              rentingRules: _rulesController.text.trim(),
                              productId: widget.productId!.id,
                              imageUrl: imageUrl,
                              videoUrl: videoUrl,
                              inStock: widget.inStock);
                          if (success == true) {
                            await widget.productCubit.getAllProducts();

                            if (!mounted) return;
                            context
                                .showSuccessSnack("Item edited successfully");
                            Navigator.of(context).pop();
                          }
                        } else {}
                      }
                    }
                    loading = false;
                  },
          ),
        )
      ],
    );
  }
}
