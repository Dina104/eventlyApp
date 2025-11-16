import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:evently_app_app/feature/main_layout/tabs/home/event_item.dart';
import 'package:evently_app_app/firebase_service/firebase_service.dart';
import 'package:evently_app_app/l10n/app_localizations.dart';
import 'package:evently_app_app/models/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Container(
      child: SafeArea(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
                    ),
                    prefixIcon: Icon(Icons.search, color: ColorsManager.blue),
                    hintText: "${appLocalization.search_for_event}",
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            FutureBuilder(
              future: FirebaseService.getFavouriteEvents(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                List<EventModel> favouriteEvents = snapshot.data ?? [];
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        EventItem(event: favouriteEvents[index], favouriteEvent: true),
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemCount: favouriteEvents.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
