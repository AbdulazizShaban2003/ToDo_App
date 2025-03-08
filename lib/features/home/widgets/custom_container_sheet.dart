import 'package:flutter/material.dart';

import '../../../core/themes/app_color.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/size_manager.dart';
import '../components/build_container.dart';

class CustomContainerSheet extends StatelessWidget {
  const CustomContainerSheet({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.deepGreyColor,
      width: double.infinity,
      height:  SizeManager.appSizeHeight(context: context, heightApp: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildContainer(
              theme: theme,
              action: MyString.taskComplete,
              onPressed: () {},
              color: AppColor.primaryLightColor,
            ),
            BuildContainer(
              theme: theme,
              action: MyString.deleteTaske,
              onPressed: () {},
              color: AppColor.redColor,
            ),
            BuildContainer(
              theme: theme,
              action: MyString.cancel,
              onPressed: () {},
              color: AppColor.primaryLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
