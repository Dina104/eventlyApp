import 'package:evently/core/resourese/assets_manager.dart';
import 'package:evently/core/resourese/colors_manager.dart';
import 'package:evently/core/routes_manager/routes_manager.dart';
import 'package:evently/feature/main_layout/tabs/profile/drop_down_item.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.Rectangle),
                  SizedBox(width: 16.w),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          UserModel.currentUser!.name,
                          style: GoogleFonts.inter(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.Whiteblue,
                          ),
                        ),
                        Text(
                          UserModel.currentUser!.email,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.Whiteblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        DropDownItem(
          onChange: (newTheme) {
            themeProvider.changeAppTheme(
              newTheme == appLocalization.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
          lable: appLocalization.theme,
          selecteditem:
              themeProvider.isDark
                  ? appLocalization.dark
                  : appLocalization.light,
          menuItems: [appLocalization.light, appLocalization.dark],
        ),
        SizedBox(height: 16.h),
        DropDownItem(
          onChange: (newLang) {
            languageProvider.voidChangeAppLanguage(
              newLang == "English" ? "en" : "ar",
            );
          },
          lable: appLocalization.langauge,
          selecteditem: languageProvider.isEnglish ? "English" : "عربي",
          menuItems: ["English", "عربي"],
        ),
        Spacer(flex: 6),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 120),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.all(16.0),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.Whiteblue,
              textStyle: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.Whiteblue,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            onPressed: _logout,
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.logout_outlined),
                  SizedBox(width: 8.w),
                  Text(appLocalization.logout),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, RoutesManager.login);
  }
}
