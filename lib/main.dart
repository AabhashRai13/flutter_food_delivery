import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/OrderTableItemAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/language_cubit.dart';
import 'package:hungerz_store/map_utils.dart';
import 'package:hungerz_store/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAppModule();
  MapUtils.getMarkerPic();
  runApp(Phoenix(child: const HungerzStore()));
}

class HungerzStore extends StatelessWidget {
  const HungerzStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit()..getCurrentLanguage(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..getCurrentTheme(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(builder: (_, locale) {
            return MaterialApp(
              localizationsDelegates:const [
                 AppLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.getSupportedLocales(),
              debugShowCheckedModeBanner: false,
              locale: locale,
              theme: theme,
              home: Settings(),
              // home: LoginNavigator(),
              routes: PageRoutes().routes(),
            );
          });
        },
      ),
    );
  }
}
