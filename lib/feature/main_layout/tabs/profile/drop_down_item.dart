import 'package:evently/core/resourese/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownItem extends StatelessWidget {
  const DropDownItem({
    super.key,
    required this.lable,
    required this.menuItems,
    required this.selecteditem,
    required this.onChange,
  });
  final String lable;
  final String selecteditem;
  final List<String> menuItems;
  final void Function(String?)onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lable, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: 16.h),
          Container(
            height: 66,
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: ColorsManager.blue, width: 1),
            ),
            child: Row(
              children: [
                Text(selecteditem, style: Theme.of(context).textTheme.displayMedium),
                Spacer(),
                DropdownButton<String>(
                  underline: SizedBox(),
                  items:
                  menuItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: onChange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}