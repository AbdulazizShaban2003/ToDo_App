import 'package:flutter/material.dart';
import 'package:todo_app/core/themes/app_color.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.blackColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.whiteColor,
          ),
        ),
        title: Text(
          "Add Task",
          style: theme.displayMedium!.copyWith(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
          child: Column(
            children: [
              Text("Title",style: theme.displayMedium,),
              SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter title here",
                  hintStyle: theme.displayMedium
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
