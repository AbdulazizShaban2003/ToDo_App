import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/app_strings.dart' show MyString;
import '../../../core/utils/size_manager.dart';

class CustomListOfColorTask extends StatefulWidget {
  const CustomListOfColorTask({super.key, required this.theme});
  final TextTheme theme;

  @override
  State<CustomListOfColorTask> createState() => _CustomListOfColorTaskState();

}
int? currentIndex;


class _CustomListOfColorTaskState extends State<CustomListOfColorTask> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(MyString.color, style: widget.theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(
            context: context,
            heightApp: 0.01,
          ),
        ),
        SizedBox(
          height: SizeManager.appSizeHeight(
            context: context,
            heightApp: 0.07,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Color getColor(int index) {
                switch (index) {
                  case 0:
                    return AppColor.redColor;
                  case 1:
                    return AppColor.greenLightColor;
                  case 2:
                    return AppColor.GreyColor;
                  case 3:
                    return AppColor.blueColor;
                  case 4:
                    return AppColor.orangeColor;
                  case 5:
                    return AppColor.primaryColor;
                  default:
                    return AppColor.redColor;
                }
              }

              return InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: CircleAvatar(
                  radius:
                  SizeManager.appSizeWidth(
                    context: context,
                    widthApp: 0.0088,
                  ) *
                      SizeManager.appSizeHeight(
                        context: context,
                        heightApp: 0.0088,
                      ),
                  backgroundColor: getColor(index),
                  child: index == currentIndex ? Icon(Icons.check) : null,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: SizeManager.appSizeWidth(
                  context: context,
                  widthApp: 0.02,
                ),
              );
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}

