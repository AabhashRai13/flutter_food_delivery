import 'package:flutter/material.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/textfield.dart';

import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';
import 'package:hungerz_store/models/shop.dart';

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
  late final TextEditingController _categoryEditingController =
      TextEditingController();

  late final TextEditingController _phoneNumberEditingController;

  late final TextEditingController _emailAddressEditingController;

  late final TextEditingController _descriptionEditingController;
  final UserCubit _userCubit = instance<UserCubit>();

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController(text: widget.shop!.name);
    _phoneNumberEditingController =
        TextEditingController(text: widget.shop!.phoneNumber);
    _emailAddressEditingController =
        TextEditingController(text: widget.shop!.email ?? "");
    _descriptionEditingController =
        TextEditingController(text: widget.shop!.description);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(bottom: 70),
          children: <Widget>[
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      AppLocalizations.of(context)!.featureImage!.toUpperCase(),
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
                        child: Image.asset('images/Layer 1.png'),
                      ),
                      const SizedBox(width: 24.0),
                      Icon(
                        Icons.camera_alt,
                        color: kMainColor,
                        size: 25.0,
                      ),
                      const SizedBox(width: 14.3),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    AppLocalizations.of(context)!.profileInfo!.toUpperCase(),
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
                      textEditingController: _descriptionEditingController),
                ),
                //phone textField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SmallTextFormField(
                      // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                      label: "Category",
                      title: "Enter Category",
                      icon: null,
                      textEditingController: _categoryEditingController),
                ),
                //email textField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SmallTextFormField(
                      // AppLocalizations.of(context)!.fullName!.toUpperCase(),
                      label: "Email",
                      title: "Enter email",
                      icon: null,
                      initial: "Food Junction",
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
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.locationPage),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.black, fontSize: 14),
                            initialValue:
                                " 1124, Veggy Garden, City Food Park, United States",
                            decoration: InputDecoration(
                                prefix: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, PageRoutes.locationPage),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
              text: AppLocalizations.of(context)!.updateInfo,
              onTap: () async {
                // Navigator.pushNamed(context, PageRoutes.accountPage);

                await _userCubit.updateShop(
                    categoryId: "nQEiE237G5zj24rUkbrG",
                    address: "Ramechap, kapilvastu",
                    name: _nameEditingController.text.trim(),
                    description: _descriptionEditingController.text.trim(),
                    isPopular: true,
                    phoneNumber: _phoneNumberEditingController.text.trim(),
                    imageUrl:
                        "https://staticg.sportskeeda.com/editor/2022/06/1acf7-16544386413156-1920.jpg");
              }),
        ),
      ],
    );
  }
}
