import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/Registration/UI/register_text_field.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Maps/UI/location_page.dart';

import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';
import 'package:hungerz_store/extension.dart';

//register page for registration of a new user
class RegisterPage extends StatelessWidget {
  final VoidCallback onVerificationDone;
  const RegisterPage(this.onVerificationDone, {super.key});

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
      body: RegisterForm(onVerificationDone),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final VoidCallback onVerificationDone;
  const RegisterForm(this.onVerificationDone, {super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;
  String shopAddress = '';
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> signupKey = GlobalKey();
  final UserCubit _userCubit = instance<UserCubit>();
  // RegisterBloc _registerBloc;
  String? userId;
  @override
  void initState() {
    super.initState();
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
                hint: shopAddress,
                onlyRead: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LocationPage(
                                shopAddress: shopAddress,
                                lat: lat,
                                lng: lng,
                              )));
                },
                img: 'images/location.png',
                // validator: (value) {
                //   if (shopAddress == "") {
                //     return 'Set location';
                //   } else {
                //     return null;
                //   }
                // },
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
                  log("controller ${_addressController.text.trim()}");
                  if (signupKey.currentState!.validate()) {
                    signupKey.currentState!.save();
                    bool success = await _userCubit.updateShop(
                        categoryId: "nQEiE237G5zj24rUkbrG",
                        address: shopAddress,
                        name: _nameController.text.trim(),
                        description: _descriptionController.text.trim(),
                        latitude: lat,
                        longitude: lng,
                        isPopular: true,
                        phoneNumber: _phoneNumberController.text.trim(),
                        imageUrl:
                            "https://staticg.sportskeeda.com/editor/2022/06/1acf7-16544386413156-1920.jpg");
                    if (success) {
                      widget.onVerificationDone();
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
