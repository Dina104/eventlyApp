import 'package:evently/core/resourese/colors_manager.dart';
import 'package:evently/core/widget/custom_tab_bar.dart';
import 'package:evently/feature/main_layout/tabs/home/event_item.dart';
import 'package:evently/firebase_service/firebase_service.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  late CategoryModel selectedCategory =
      CategoryModel.getCategoriesWithAll(context)[0];

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Column(
      children: [
        Container(
          padding: REdgeInsets.only(top: 40),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(14.r)),
          ),
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appLocalizations.welcome_message,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          UserModel.currentUser?.name ?? "Guest",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),

                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorsManager.Whiteblue,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "Cairo , Egypt",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        themeProvider.changeAppTheme(
                          themeProvider.isDark
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                      },
                      icon: Icon(
                        themeProvider.isDark
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode,
                        color: ColorsManager.Whiteblue,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        languageProvider.voidChangeAppLanguage(
                          languageProvider.isEnglish ? "ar" : "en",
                        );
                      },
                      child: Card(
                        color: ColorsManager.Whiteblue,
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(
                            languageProvider.isEnglish ? "En" : "Ar",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomTabBar(
                onCategoryItemClicked: (category) {
                  selectedCategory = category;
                  setState(() {});
                },
                categories: CategoryModel.getCategoriesWithAll(context),
                selectedBgcolor: ColorsManager.Whiteblue,
                selectedFgcolor: ColorsManager.blue,
                unselectedBgcolor: Colors.transparent,
                unselectedFgcolor: ColorsManager.Whiteblue,
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: FirebaseService.getEvents(context, selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            List<EventModel> events = snapshot.data ?? [];
            return Expanded(
              child: ListView.separated(
                itemBuilder:
                    (context, index) => EventItem(
                      event: events[index],
                      favouriteEvent: UserModel.currentUser!.favouriteEventsIds
                          .contains(events[index].eventId),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: events.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
