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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MapUtils.getMarkerPic();
  runApp(Phoenix(child: HungerzStore()));
}

class HungerzStore extends StatelessWidget {
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
              localizationsDelegates: [
                const AppLocalizationsDelegate(),
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
