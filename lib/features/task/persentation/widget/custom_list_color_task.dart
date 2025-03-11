import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_color.dart';
import '../../../../core/utils/app_strings.dart' show MyString;
import '../../../../core/utils/size_manager.dart';
import '../../../states/cubit/task_cubit.dart';
import '../../../states/cubit/task_state.dart';

class CustomListOfColorTask extends StatelessWidget {
  const CustomListOfColorTask({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        int? currentIndex;
        if (state is SelectColorState) {
          currentIndex = state.currentIndex;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(MyString.color, style: theme.displayMedium),
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

                  return InkWell(
                    onTap: () {
                      context.read<TaskCubit>().selectColor(index);

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
      },
    );
  }
}



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


