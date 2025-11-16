import 'package:evently_app_app/core/extentions/date_time_ex.dart';
import 'package:evently_app_app/core/resourese/assets_manager.dart';
import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:evently_app_app/firebase_service/firebase_service.dart';
import 'package:evently_app_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatefulWidget {
  EventItem({super.key, required this.event, required this.favouriteEvent});
  final EventModel event;
  bool favouriteEvent;

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  late bool isFavourite = widget.favouriteEvent;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: REdgeInsets.symmetric(horizontal: 8),
          padding: REdgeInsets.all(8),
          width: double.infinity,
          height: 203,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(widget.event.category.imagePath),
            ),

            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsManager.blue, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.event.dateTime.day.toString(),
                        style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.event.dateTime.viewMonth.toString(),
                        style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Card(
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.event.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: _markEventAsFavourite,
                        icon: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: ColorsManager.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _markEventAsFavourite() async {
    if (isFavourite = true) {
      await FirebaseService.removeEventFromFavourite(widget.event);
      isFavourite = false;
    } else {
      await FirebaseService.addEventToFavourite(widget.event);
      isFavourite = true;
    }
    setState(() {});
  }
}
