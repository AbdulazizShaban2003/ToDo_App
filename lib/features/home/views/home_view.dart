import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/size_manager.dart';
import 'package:todo_app/features/home/widgets/custom_fab.dart' show FAB;
import '../../../core/themes/app_color.dart';
import '../components/task.dart';
import '../widgets/custom_container_sheet.dart';
import '../widgets/custom_list_date.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      floatingActionButton: const FAB(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:  SizeManager.appSizeWidth(
          context: context,
          widthApp: 0.04,
        ), vertical:  SizeManager.appSizeHeight(
          context: context,
          heightApp: 0.06,
        ),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:  SizeManager.appSizeHeight(
              context: context,
              heightApp: 0.007,
            ),),
            CustomlistDate(theme: theme),
            SizedBox(
              height: SizeManager.appSizeHeight(
                context: context,
                heightApp: 0.04,
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return CustomContainerSheet(theme: theme);
                  },
                );
              },
              child: CustomTask(theme: theme),
            ),

            // CustomNotask(theme: theme),
          ],
        ),
      ),
    );
  }
}

