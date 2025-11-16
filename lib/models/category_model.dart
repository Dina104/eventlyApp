import 'package:evently/core/resourese/assets_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData iconData;
  String imagePath;
  CategoryModel({
    required this.id,
    required this.name,
    required this.iconData,
    required this.imagePath,
  });



static List<CategoryModel>getCategoriesWithAll(BuildContext context){
  AppLocalizations appLocalization = AppLocalizations.of(context)!;

  return [
  CategoryModel(id:"0", name:appLocalization.all, iconData: Icons.all_inclusive_outlined, imagePath: AssetsManager.sports),
  CategoryModel(id:"1", name: appLocalization.sports, iconData: Icons.sports_bar_rounded, imagePath: AssetsManager.exhibition),
  CategoryModel(id:"2", name: appLocalization.birthday, iconData: Icons.cake_rounded, imagePath: AssetsManager.holiday),
  CategoryModel(id:"3", name: appLocalization.meeting, iconData: Icons.laptop_chromebook_rounded, imagePath: AssetsManager.eating),
  CategoryModel(id:"4", name: appLocalization.gaming, iconData: Icons.gamepad_rounded, imagePath: AssetsManager.gaming),
  CategoryModel(id:"5", name: appLocalization.eating, iconData: Icons.local_pizza_outlined, imagePath: AssetsManager.Bookclub),
  CategoryModel(id:"6", name: appLocalization.holiday, iconData: Icons.holiday_village_outlined, imagePath: AssetsManager.Birthday),
  CategoryModel(id:"7", name: appLocalization.exhibition, iconData: Icons.water_drop_outlined, imagePath: AssetsManager.workshop),
  CategoryModel(id:"8", name: appLocalization.work_shop, iconData: Icons.work_history_outlined, imagePath: ""),
  CategoryModel(id:"9", name: appLocalization.book_club, iconData: Icons.book_rounded, imagePath: ""),


];
}
  static List<CategoryModel>getCategories(BuildContext context){
    AppLocalizations appLocalization = AppLocalizations.of(context)!;
    return [
      CategoryModel(id:"1", name: appLocalization.sports, iconData: Icons.sports_bar_rounded, imagePath: AssetsManager.sports),
      CategoryModel(id:"2", name: appLocalization.birthday, iconData: Icons.cake_rounded, imagePath: AssetsManager.exhibition),
      CategoryModel(id:"3", name: appLocalization.meeting, iconData: Icons.laptop_chromebook_rounded, imagePath: AssetsManager.holiday),
      CategoryModel(id:"4", name: appLocalization.gaming, iconData: Icons.gamepad_rounded,  imagePath: AssetsManager.eating),
      CategoryModel(id:"5", name: appLocalization.eating, iconData: Icons.local_pizza_outlined, imagePath: AssetsManager.gaming),
      CategoryModel(id:"6", name: appLocalization.holiday, iconData: Icons.holiday_village_outlined,imagePath: AssetsManager.Birthday),
      CategoryModel(id:"7", name: appLocalization.exhibition, iconData: Icons.water_drop_outlined, imagePath: AssetsManager.workshop),
      CategoryModel(id:"8", name: appLocalization.work_shop, iconData: Icons.work_history_outlined, imagePath: ""),
      CategoryModel(id:"9", name: appLocalization.book_club, iconData: Icons.book_rounded, imagePath: ""),


    ];
  }


}
