import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/Registration/UI/register_text_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';

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
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> signupKey = GlobalKey();
  final UserCubit _userCubit = instance<UserCubit>();
  // RegisterBloc _registerBloc;
  String? userId;
  @override
  void initState() {
    super.initState();
    // _registerBloc = BlocProvider.of<RegisterBloc>(context);
    setUserId();
  }

  setUserId() async {
    // userId = await _appPreferences.getUserID("USER_ID") ?? "";
    userId = FirebaseAuth.instance.currentUser!.uid;
    log("user Id $userId");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
                title: AppLocalizations.of(context)!.fullNamee!.toUpperCase(),
                hint: "Samantha Smith",
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
                title:
                    AppLocalizations.of(context)!.emailAddress!.toUpperCase(),
                hint: 'samanthasmith@mail.com',
                img: 'images/icons/ic_mail.png',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Address should not be empty';
                  } else if (!value.isValidEmail()) {
                    return 'Email Address is not valid';
                  } else {
                    return null;
                  }
                },
              ),

              RegisterTextField(
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
                    bool success = await _userCubit.updateUser(
                        userId: userId,
                        email: "sujan@gmail.com",
                        phoneNumber: "9860168588",
                        name: "Sujan Lamichhane",
                        photoUrl:
                            "https://staticg.sportskeeda.com/editor/2022/06/1acf7-16544386413156-1920.jpg");
                    if (success) {
                      // Navigator.pushNamed(context, LoginRoutes.verification);

                    }
                  }
                }),
          )
        ],
      ),
    );
  }

  inputField(
    String title,
    String hint,
    String img,
  ) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            height: 20,
            child: Image(
              image: AssetImage(
                img,
              ),
              color: kMainColor,
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12))
        ],
      ),
      Container(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          children: [
            SmallTextFormField(null, hint, null, hint),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )
    ]);
  }
}
