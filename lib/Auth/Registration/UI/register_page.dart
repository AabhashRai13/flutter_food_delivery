import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/Registration/UI/register_text_field.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Maps/UI/location_page.dart';

import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';
import 'package:hungerz_store/extension.dart';
import 'package:hungerz_store/models/category.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/repositories/category_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Routes/routes.dart';

//register page for registration of a new user
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          AppLocalizations.of(context)!.register!,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      //this column contains 3 textFields and a bottom bar
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  double lat = 0.0;
  double long = 0.0;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _choosenCategory;
  GlobalKey<FormState> signupKey = GlobalKey();
  final UserCubit _userCubit = instance<UserCubit>();
  var imageUrl;
  File? image;
  // RegisterBloc _registerBloc;
  List<CategoryId> categoryList = [];
  String? userId;
  @override
  void initState() {
    super.initState();
    getCategoryId();
  }

  getCategoryId() async {
    categoryList = await CategoryRepository().getAllCategory();
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
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupKey,
      child: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              Divider(
                color: Theme.of(context).cardColor,
                thickness: 8.0,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 99.0,
                      width: 99.0,
                      child: image != null
                          ? Image.file(image!)
                          : Image.asset("images/account/profile_icon.png")),
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
                                    title: const Text('Pick From Gallery'),
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
                    child: Text(AppLocalizations.of(context)!.uploadPhoto!,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: kMainColor)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // inputField(AppLocalizations.of(context)!.fullNamee!.toUpperCase(),
              //     'Samantha Smith', 'images/icons/ic_name.png'),
              RegisterTextField(
                onlyRead: false,
                textEditingController: _nameController,
                title: "Shop Name",
                hint: "your Shop name",
                img: 'images/icons/ic_name.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name should not be empty';
                  }
                  return null;
                },
              ),
              //name textField

              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 22,
                        child: Image(
                          image: AssetImage(
                            'images/icons/ic_phone.png',
                          ),
                          color: kMainColor,
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text("Category",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox.shrink(),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
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
                                  ),
                                  hint: const Text("Select Category"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Colors.black, fontSize: 14),
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
                                      child: Text(CategoryId.name.name),
                                      value: CategoryId.categoryId,
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    _choosenCategory = value;
                                  }),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //email textField
              RegisterTextField(
                onlyRead: false,
                textEditingController: _emailController,
                title: "Email Address",
                hint: 'abc@gmail.com',
                img: 'images/icons/ic_phone.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Address is required';
                  } else if (!value.isValidEmail()) {
                    return 'Email address is not valid';
                  } else {
                    return null;
                  }
                },
              ),
              RegisterTextField(
                textEditingController: _addressController,
                title: "Address",
                hint: "Select your address",
                onlyRead: true,
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
                img: 'images/location.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Set location';
                  } else {
                    return null;
                  }
                },
              ),

              RegisterTextField(
                onlyRead: false,
                textEditingController: _descriptionController,
                title: "Description",
                hint: 'your shop description',
                img: 'images/icons/ic_phone.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Brief description is required';
                  } else {
                    return null;
                  }
                },
              ),
              RegisterTextField(
                onlyRead: false,
                textEditingController: _phoneNumberController,
                title:
                    AppLocalizations.of(context)!.mobileNumber!.toUpperCase(),
                hint: '+1 987 654 3210',
                img: 'images/icons/ic_phone.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Number is required';
                  } else {
                    return null;
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  AppLocalizations.of(context)!.verificationText!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 12.8),
                ),
              ),
            ],
          ),
          //continue button bar
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
                text: AppLocalizations.of(context)!.continueText,
                onTap: () async {
                  if (signupKey.currentState!.validate()) {
                    signupKey.currentState!.save();

                    bool success = await _userCubit.updateShop(
                        email: _emailController.text.trim(),
                        categoryId: _choosenCategory!,
                        address: _addressController.text.trim(),
                        name: _nameController.text.trim(),
                        description: _descriptionController.text.trim(),
                        latitude: lat,
                        longitude: long,
                        isPopular: true,
                        phoneNumber: _phoneNumberController.text.trim(),
                        imageUrl: imageUrl);
                    if (success) {
                      if (!mounted) return;
                      Navigator.popAndPushNamed(
                          context, PageRoutes.orderTableItemAccountPage);
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
