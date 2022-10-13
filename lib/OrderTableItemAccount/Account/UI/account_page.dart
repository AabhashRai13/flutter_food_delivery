// import 'package:buy_this_app/buy_this_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz_store/Components/list_tile.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderTableItemAccount/StoreProfile/store_profile.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';
import 'package:hungerz_store/app/di.dart';
import 'package:hungerz_store/bloc/user/user_cubit.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // late ThemeCubit _themeCubit;
    // _themeCubit = BlocProvider.of<ThemeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.account!,
            style: Theme.of(context).textTheme.bodyText1),
        centerTitle: true,
      ),
      body: const Account(),
    );
  }
}

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {
  String? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 5),
      children: <Widget>[
        const StoreDetails(),
        Divider(
          color: Theme.of(context).cardColor,
          thickness: 8.0,
        ),
        BuildListTile(
            image: 'images/account/ic_menu_insight.png',
            text: AppLocalizations.of(context)!.insight,
            onTap: () => Navigator.pushNamed(context, PageRoutes.insightPage)),
        BuildListTile(
          image: 'images/account/ic_menu_wallet.png',
          text: AppLocalizations.of(context)!.wallet,
          onTap: () => Navigator.pushNamed(context, PageRoutes.walletPage),
        ),
        BuildListTile(
            image: 'images/account/ic_menu_reviewsact.png',
            text: AppLocalizations.of(context)!.review,
            onTap: () => Navigator.pushNamed(context, PageRoutes.review)),
        BuildListTile(
            image: 'images/account/ic_auth.png',
            text: "Authentication",
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.authentication)),
        BuildListTile(
            image: 'images/account/ic_menu_tncact.png',
            text: AppLocalizations.of(context)!.tnc,
            onTap: () => Navigator.pushNamed(context, PageRoutes.tncPage)),
        BuildListTile(
            image: 'images/account/ic_menu_supportact.png',
            text: AppLocalizations.of(context)!.support,
            onTap: () => Navigator.pushNamed(context, PageRoutes.supportPage,
                arguments: number)),
        BuildListTile(
            image: 'images/account/ic_menu_setting.png',
            text: AppLocalizations.of(context)!.settings,
            onTap: () => Navigator.pushNamed(context, PageRoutes.setting,
                arguments: number)),
        const LogoutTile(),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class LogoutTile extends StatelessWidget {
  const LogoutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildListTile(
      image: 'images/account/ic_menu_logoutact.png',
      text: AppLocalizations.of(context)!.logout,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.loggingOut!),
                content: Text(AppLocalizations.of(context)!.areYouSure!),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kTransparentColor)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppLocalizations.of(context)!.no!,
                      style: TextStyle(
                        color: kMainColor,
                      ),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kTransparentColor)),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.yes!,
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      onPressed: () async {
                        FirebaseAuth.instance.signOut();
                        Phoenix.rebirth(context);
                      })
                ],
              );
            });
      },
    );
  }
}

class StoreDetails extends StatefulWidget {
  const StoreDetails({super.key});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  final UserCubit _userCubit = instance<UserCubit>();
  @override
  void initState() {
    super.initState();
    _userCubit.fetchShopProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<UserCubit, UserState>(
        bloc: _userCubit,
        builder: (context, state) {
          if (state is ShopLoaded) {
            return Row(
              children: <Widget>[
                const Image(
                  image: AssetImage("images/Layer 1.png"),
                  height: 98.0,
                  width: 98.0,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(state.shop.name!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 15.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: kLightTextColor,
                          size: 10.0,
                        ),
                        const SizedBox(width: 5.0),
                        Text(state.shop.address!,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    color: const Color(0xff4a4b48),
                                    fontSize: 13.3)),
                      ],
                    ),
                    GestureDetector(
                        child: Text(
                          '\nShop Profile',
                          style: TextStyle(
                              color: kMainColor,
                              fontSize: 13.3,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                      shop: state.shop,
                                    )),
                          );
                        }),
                    Text(state.shop.email ?? "",
                        style: Theme.of(context).textTheme.subtitle2),
                  ],
                ),
              ],
            );
          }

          return Row(
            children: <Widget>[
              const Image(
                image: AssetImage("images/Layer 1.png"),
                height: 98.0,
                width: 98.0,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.store!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: kLightTextColor,
                        size: 10.0,
                      ),
                      const SizedBox(width: 5.0),
                      Text(AppLocalizations.of(context)!.storeAddress!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: const Color(0xff4a4b48),
                                  fontSize: 13.3)),
                    ],
                  ),

                  GestureDetector(
                    child: Text(
                      '\n${AppLocalizations.of(context)!.storeProfile!}',
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 13.3,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {},
                  )

                  //  Text(email, style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
