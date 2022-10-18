import 'package:flutter/material.dart';
import 'package:hungerz_store/Auth/login_navigator.dart';
import 'package:hungerz_store/Chat/UI/chat_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/insight_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/support_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/tnc_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/wallet_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/account_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/order_page.dart';
import 'package:hungerz_store/OrderTableItemAccount/Order/UI/track_order.dart';
import 'package:hungerz_store/OrderTableItemAccount/StoreProfile/store_profile.dart';

import 'package:hungerz_store/Pages/items.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/authentication.dart';

class PageRoutes {
  static const String orderTableItemAccountPage = 'order_item_account';
  static const String accountPage = 'account_page';
  static const String orderPage = 'order_page';
  // static const String orderInfoPage = 'orderinfo_page';
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
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
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
      case PageRoutes.loginNavigator:
        return MaterialPageRoute(builder: (_) => const LoginNavigator());
      case PageRoutes.walletPage:
        return MaterialPageRoute(builder: (_) => const WalletPage());
      case PageRoutes.chatPage:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChatPage(
                  clientName: args,
                ));
      case PageRoutes.insightPage:
        return MaterialPageRoute(builder: (_) => InsightPage());
      case PageRoutes.storeProfile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case PageRoutes.items:
        return MaterialPageRoute(builder: (_) => const ItemsPage());
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
