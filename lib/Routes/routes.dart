import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/MobileNumber/UI/phone_number.dart';
import 'package:hungerz_store/Auth/Registration/UI/register_page.dart';
import 'package:hungerz_store/Auth/Verification/UI/verification_page.dart';
import 'package:hungerz_store/Auth/social.dart';
import 'package:hungerz_store/Chat/UI/chat_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/addtobank_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/insight_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/reviews.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/support_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/tnc_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/wallet_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/account_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/order_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/track_order.dart';
import 'package:hungerz_store/OrderTableItemAccount/StoreProfile/store_profile.dart';
import 'package:hungerz_store/OrderTableItemAccount/order_table_item_account.dart';

import 'package:hungerz_store/Pages/items.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/authentication.dart';

class PageRoutes {
  static const String orderTableItemAccountPage = 'order_item_account';
  static const String accountPage = 'account_page';
  static const String orderPage = 'order_page';
  static const String tncPage = 'tnc_page';
  static const String savedAddressesPage = 'saved_addresses_page';
  static const String supportPage = 'support_page';
  static const String walletPage = 'wallet_page';
  static const String loginNavigator = 'login_navigator';
  static const String chatPage = 'chat_page';
  static const String insightPage = 'insight_page';
  static const String storeProfile = 'store_profile';
  static const String items = 'items';
  static const String addToBank = 'addtobank_page';
  static const String review = 'reviews';
  static const String setting = 'settings_page';
  static const String track = 'track_order';
  static const String authentication = 'authentication_list';
  static const String loginRoot = 'login/';
  static const String social = 'login/social';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
  static const String home = 'home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case PageRoutes.loginRoot:
        return MaterialPageRoute(builder: (_) => const PhoneNumber());
      case PageRoutes.social:
        return MaterialPageRoute(builder: (_) => const SocialLogIn());
      case PageRoutes.registration:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case PageRoutes.verification:
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case PageRoutes.track:
        return MaterialPageRoute(builder: (_) => const TrackOrderPage());
      case PageRoutes.orderPage:
        return MaterialPageRoute(builder: (_) => const OrderPage());
      case PageRoutes.accountPage:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case PageRoutes.tncPage:
        return MaterialPageRoute(builder: (_) => TncPage());
      case PageRoutes.supportPage:
        return MaterialPageRoute(builder: (_) => SupportPage());
      case PageRoutes.walletPage:
        return MaterialPageRoute(builder: (_) => const WalletPage());
      case PageRoutes.chatPage:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case PageRoutes.insightPage:
        return MaterialPageRoute(builder: (_) => InsightPage());
      case PageRoutes.storeProfile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case PageRoutes.addToBank:
        return MaterialPageRoute(builder: (_) => const AddToBank());
      case PageRoutes.items:
        return MaterialPageRoute(builder: (_) => const ItemsPage());
      case PageRoutes.orderTableItemAccountPage:
        return MaterialPageRoute(builder: (_) => const OrderItemAccount());
      case PageRoutes.review:
        return MaterialPageRoute(builder: (_) => ReviewPage());
      case PageRoutes.setting:
        return MaterialPageRoute(builder: (_) => const Settings());
      case PageRoutes.authentication:
        return MaterialPageRoute(builder: (_) => const AuthenticationList());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("no Route found"),
              ),
              body: const Center(child: Text("no route found")),
            ));
  }
}
