import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/size_manager.dart';

class CustomTitleInput extends StatelessWidget {
  const CustomTitleInput({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyString.title, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: MyString.hintTextTitle),
        ),
      ],
    );
  }
}
