
import 'package:evently_app_app/core/widget/tab_item.dart';
import 'package:evently_app_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.selectedBgcolor,
    required this.selectedFgcolor,
    required this.unselectedBgcolor,
    required this.unselectedFgcolor,
    required this.categories,
    required this.onCategoryItemClicked,

  });
  final Color selectedBgcolor;
  final Color unselectedBgcolor;
  final Color selectedFgcolor;
  final Color unselectedFgcolor;
  final List<CategoryModel>categories;
  final void Function(CategoryModel)? onCategoryItemClicked;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: (index) {
          widget.onCategoryItemClicked?.call(widget.categories[index]);
          selectedindex = index;
          setState(() {});
        },

        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs:
           widget.categories
                .map(
              (category) => TabItem(
                selectedTabBgColor: widget.selectedBgcolor,
                selectedTabFgColor: widget.selectedFgcolor,
                UnselectedTabBgColor: widget.unselectedBgcolor,
                UnselectedTabFgColor: widget.unselectedFgcolor,
                isSelected:
                    selectedindex ==
                    widget.categories.indexOf(category),
                category: category,
              ),
            ).toList(),
      ),
    );
  }
}
