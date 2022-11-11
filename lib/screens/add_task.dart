import 'package:flutter/material.dart';
import 'package:tsk_management/app_colors.dart';
import 'package:tsk_management/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import '../widgets/button_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/addtask1.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  )),
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                  textController: nameController,
                  hitText: "Task name",
                  borderRadius: 30.0),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hitText: "Task name",
                  borderRadius: 15.0,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  backgroundcolor: AppColors.mainColor,
                  text: "Add Task",
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
          ]
        ),
      ),
    );
  }
}
