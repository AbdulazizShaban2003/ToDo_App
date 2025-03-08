import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/size_manager.dart';

class CustomNoteInput extends StatelessWidget {
  const CustomNoteInput({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(MyString.note, style: theme.displayMedium),
        SizedBox(
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.02),
        ),
        TextFormField(
          decoration: InputDecoration(hintText: MyString.hintTextNote),
        ),
      ],
    );
  }
}
