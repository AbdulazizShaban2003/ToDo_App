import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';

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
      height: 170,
      decoration: BoxDecoration(
        color: AppColor.redColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  color: Colors.white,
                  width: 2,
                  height: 80,
                  margin: EdgeInsets.only(right: 10),
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
