import 'package:evently_app_app/core/Ui_Utils/Ui_Utils.dart';
import 'package:evently_app_app/core/extentions/date_time_ex.dart';
import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:evently_app_app/core/widget/custom_elevated_buttom.dart';
import 'package:evently_app_app/core/widget/custom_tab_bar.dart';
import 'package:evently_app_app/core/widget/custom_text_buttom.dart';
import 'package:evently_app_app/core/widget/custom_text_form_field.dart';
import 'package:evently_app_app/firebase_service/firebase_service.dart';
import 'package:evently_app_app/l10n/app_localizations.dart';
import 'package:evently_app_app/models/category_model.dart';
import 'package:evently_app_app/models/event_model.dart';
import 'package:evently_app_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${appLocalization.create_event} ",
          style: GoogleFonts.inter(color: ColorsManager.blue),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(selectedCategory.imagePath),
              ),
              SizedBox(height: 16),
              CustomTabBar(
                onCategoryItemClicked: (category){
                  setState(() {
                    selectedCategory = category;
                  });

                },
                selectedBgcolor: ColorsManager.blue,
                selectedFgcolor: ColorsManager.Whiteblue,
                unselectedBgcolor: Colors.transparent,
                unselectedFgcolor: ColorsManager.blue,
                categories: CategoryModel.getCategories(context),
              ),
              SizedBox(height: 16),
              Text(
                appLocalization.title,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hint: appLocalization.event_title,
                validator: (input) {},
                controller: _titleController,
                prefixIcon: Icons.edit,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalization.description,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                lines: 4,
                hint: appLocalization.event_description,
                validator: (input) {},
                controller: _descriptionController,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDate.toFormattedDate,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Spacer(),
                  CustomTextButtom(
                    textfield: appLocalization.choose_date,
                    onTap: _SelectEventDate,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDate.toFormattedTime,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Spacer(),
                  CustomTextButtom(
                    textfield: appLocalization.choose_time,
                    onTap: _selectedEventTime,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalization.location,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(height: 8.h),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorsManager.blue, width: 1.w),
                  padding: REdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Card(
                      color: ColorsManager.blue,
                      child: Padding(
                        padding: REdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_searching,
                          color: ColorsManager.Whiteblue,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Text(
                      appLocalization.choose_event_location,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomElevatedButtom(
                title: appLocalization.add_event,
                onPress: () {
                  _createEvent();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _createEvent()async{
    EventModel event = EventModel(
        userId: UserModel.currentUser!.id,
        eventId: " ",
        category: selectedCategory,
        title: _titleController.text,
        description: _descriptionController.text,
        dateTime: selectedDate,
    );
    UIUtils.showLoading(context);
     await FirebaseService.addEventToFireStore(event, context);
     UIUtils.hideDialog(context);
     UIUtils.showtoastMessage("Event Created successfully", Colors.green);
     Navigator.pop(context);

  }

  void _SelectEventDate() async {
    selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDate;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }

  void _selectedEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        selectedTime;
    selectedDate = selectedDate.copyWith(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );
    setState(() {});
  }
}
