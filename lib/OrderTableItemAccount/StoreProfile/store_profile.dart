import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Maps/UI/location_page.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';
import 'package:hungerz_store/constants_utils.dart';
import 'package:hungerz_store/extension.dart';
import 'package:hungerz_store/models/category.dart';
import 'package:hungerz_store/models/shop.dart';
import 'package:hungerz_store/repositories/category_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  static const String id = 'register_page';
  final String? phoneNumber;
  final Shop? shop;
  const ProfilePage({super.key, this.phoneNumber, this.shop});

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
          AppLocalizations.of(context)!.editProfile!,
          style: const TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: RegisterForm(phoneNumber, shop),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final String? phoneNumber;
  final Shop? shop;

  const RegisterForm(this.phoneNumber, this.shop, {super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _nameEditingController;

  late final TextEditingController _phoneNumberEditingController;

  late final TextEditingController _emailAddressEditingController;

  late final TextEditingController _descriptionEditingController;
  TextEditingController _addressController = TextEditingController();
  final UserCubit _userCubit = instance<UserCubit>();
  GlobalKey<FormState> signupKey = GlobalKey();
  double lat = 0.0;
  double long = 0.0;
  String? _choosenCategory;
  String imageUrl = '';
  File? image;

  List<CategoryId> categoryList = [];
  String? userId;

  getCategoryId() async {
    categoryList = await CategoryRepository().getAllCategory();
    var catId = await CategoryRepository().getCategory(widget.shop!);
    _choosenCategory = catId.categoryId;
    setState(() {});
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
      log("url $downloadUrl");
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

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController(text: widget.shop!.name);
    _phoneNumberEditingController =
        TextEditingController(text: widget.shop!.phoneNumber);
    _emailAddressEditingController =
        TextEditingController(text: widget.shop!.email ?? "");
    _addressController = TextEditingController(text: widget.shop!.address);
    _descriptionEditingController =
        TextEditingController(text: widget.shop!.description);
    lat = widget.shop!.latitude!;
    long = widget.shop!.longitude!;
    imageUrl = widget.shop!.imageUrl!;
    getCategoryId();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _addressController.dispose();
    _phoneNumberEditingController.dispose();
    _emailAddressEditingController.dispose();
    _descriptionEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: signupKey,
          child: ListView(
            padding: const EdgeInsets.only(bottom: 70),
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
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
                        'PROFILE IMAGE',
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
                              : (imageUrl.trim().isEmpty)
                                  ? Image.asset('images/Lay.png')
                                  : Image.network(imageUrl),
                        ),
                        const SizedBox(width: 24.0),
                        const Icon(
                          Icons.camera_alt,
                          color: uploadPhotoColor,
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
                                            log("image url $imageUrl");
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
                                  .copyWith(color: uploadPhotoColor)),
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'SHOP INFO',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //name textField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SmallTextFormField(
                        // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                        label: "Shop Name",
                        title: "Enter name",
                        icon: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Shop Name is required';
                          } else {
                            return null;
                          }
                        },
                        textEditingController: _nameEditingController),
                  ),
                  //category textField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SmallTextFormField(
                        // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                        label: "Description",
                        title: "Enter decription",
                        icon: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Brief Description is required';
                          } else {
                            return null;
                          }
                        },
                        textEditingController: _descriptionEditingController),
                  ),
                  //phone textField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Type of shop",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              prefixStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black, fontSize: 12),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!),
                              ),
                            ),
                            hint: const Text("Select Category"),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.black, fontSize: 14),
                            value: _choosenCategory,
                            validator: ((value) {
                              if (_choosenCategory == null) {
                                return 'Please select category';
                              } else {
                                return null;
                              }
                            }),
                            items: categoryList.map((CategoryId) {
                              return DropdownMenuItem<String>(
                                value: CategoryId.categoryId,
                                child: Text(CategoryId.name.name),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _choosenCategory = value;
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),

                  //email textField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SmallTextFormField(
                        // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                        label: "Email",
                        title: "Enter email",
                        icon: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email should not be empty';
                          } else if (!value.isValidEmail()) {
                            return 'Email address is not valid';
                          } else {
                            return null;
                          }
                        },
                        textEditingController: _emailAddressEditingController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SmallTextFormField(
                        // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                        label: "Phone",
                        title: "Enter Phone",
                        icon: null,
                        initial: "Food Junction",
                        keyBoardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Number is required';
                          } else {
                            return null;
                          }
                        },
                        textEditingController: _phoneNumberEditingController),
                  ),
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
                      AppLocalizations.of(context)!.address!.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                  //address textField
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LocationPage(
                                    textEditingController: _addressController,
                                  )));
                      lat = result["lat"];
                      long = result["long"];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _addressController,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.black, fontSize: 14),
                              // " 1124, Veggy Garden, City Food Park, United States",
                              decoration: InputDecoration(
                                  prefix: GestureDetector(
                                    onTap: () async {
                                      final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => LocationPage(
                                                    textEditingController:
                                                        _addressController,
                                                  )));
                                      lat = result["lat"];
                                      long = result["long"];
                                    },
                                    child: Icon(
                                      Icons.location_on,
                                      color: kMainColor,
                                      size: 17,
                                    ),
                                  ),
                                  isDense: true,
                                  prefixStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.black, fontSize: 12),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[200]!),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[200]!),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey[200]!),
                                  ),
                                  hintText: "Set Restaurant",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Colors.grey, fontSize: 14)),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      AppLocalizations.of(context)!.storeTimings!.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.67,
                          color: kHintColor),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              //continue button bar
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
              text: AppLocalizations.of(context)!.updateInfo,
              onTap: () async {
                if (signupKey.currentState!.validate()) {
                  signupKey.currentState!.save();
                  final success = await _userCubit.updateShop(
                      categoryId: _choosenCategory!,
                      address: _addressController.text.trim(),
                      name: _nameEditingController.text.trim(),
                      description: _descriptionEditingController.text.trim(),
                      isPopular: true,
                      latitude: lat,
                      longitude: long,
                      email: _emailAddressEditingController.text.trim(),
                      phoneNumber: _phoneNumberEditingController.text.trim(),
                      imageUrl: imageUrl);
                  if (success) {
                    _userCubit.fetchShopProfile();
                    if (!mounted) return;
                    context
                        .showSuccessSnack('Shop Profile Updated successfully');
                  }
                }
              }),
        ),
      ],
    );
  }
}
