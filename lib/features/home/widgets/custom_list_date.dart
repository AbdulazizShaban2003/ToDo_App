import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/size_manager.dart';

class CustomlistDate extends StatefulWidget {
  const CustomlistDate({super.key, required this.theme});

  final TextTheme theme;

  @override
  State<CustomlistDate> createState() => _CustomlistDateState();
}

DateTime _selectedDate = DateTime.now();

class _CustomlistDateState extends State<CustomlistDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMMd().format(_selectedDate),
          style: widget.theme.headlineLarge!.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
        SizedBox(height:  SizeManager.appSizeHeight(
          context: context,
          heightApp: 0.04,
        ),),
        Text(
          MyString.today,
          style: widget.theme.headlineLarge!.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.03),
        ),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.135),
          width: double.infinity,
          child: DatePicker(
            width: SizeManager.appSizeWidth(context: context, widthApp: 0.17),
            DateTime.now(),
            dayTextStyle: widget.theme.displayMedium!,
            initialSelectedDate: _selectedDate,
            selectionColor: AppColor.primaryColor,
            selectedTextColor: AppColor.whiteColor,
            dateTextStyle: widget.theme.displayMedium!,
            monthTextStyle: widget.theme.displayMedium!,

            onDateChange: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }
}
