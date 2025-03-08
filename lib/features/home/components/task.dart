import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/size_manager.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeManager.appSizeWidth(context: context, widthApp: 0.42),
      decoration: BoxDecoration(
        color: AppColor.redColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:  EdgeInsets.all(SizeManager.appSizeWidth(context: context, widthApp: 0.02)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Task1", style: theme.displayMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      color: AppColor.whiteColor,
                    ),
                    Text(
                      "09:33 PM - 09:48 PM",
                      style: theme.displayMedium,
                    ),
                  ],
                ),
                Text("Learn Dart", style: theme.displayMedium),
              ],
            ),
            Row(
              children: [
                Container(
                  color:AppColor.whiteColor,
                  width: SizeManager.appSizeWidth(context: context, widthApp: 0.004),
                  height: SizeManager.appSizeHeight(context: context, heightApp: 0.1),
                  margin: EdgeInsets.only(right: SizeManager.appSizeWidth(context: context, widthApp: 0.02)),
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text("TODO", style: theme.displayMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
