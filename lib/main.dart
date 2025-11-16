
import 'package:evently_app_app/config/theme/Theme_Manager.dart';
import 'package:evently_app_app/core/prefs_manager/prefs_manager.dart';
import 'package:evently_app_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app_app/firebase_service/firebase_service.dart';
import 'package:evently_app_app/l10n/app_localizations.dart';
import 'package:evently_app_app/models/user_model.dart';
import 'package:evently_app_app/providers/language_provider.dart';
import 'package:evently_app_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  await Firebase.initializeApp();
  if (FirebaseAuth.instance.currentUser != null) {
    UserModel.currentUser = await FirebaseService.getUsersFromFireStoreById(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const evently_app_app(),
    ),
  );
}

class evently_app_app extends StatelessWidget {
  const evently_app_app({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? RoutesManager.login
            : RoutesManager.mainlayout,
        onGenerateRoute: RoutesManager.router,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currenTheme,
        locale: Locale(languageProvider.currentLang),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
      ),
    );
  }
}