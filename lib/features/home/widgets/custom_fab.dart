import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size_manager.dart';
import 'package:todo_app/features/home/views/task_view.dart';

import '../../../core/themes/app_color.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddTask()),
        );
      },
      child: Material(
        color: AppColor.primaryLightColor,
        borderRadius: BorderRadius.circular(15),
        child: Center(child: Icon(Icons.add, color: AppColor.whiteColor)),
      ),
    );
  }
}
