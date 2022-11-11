import 'package:flutter/material.dart';
import 'package:tsk_management/app_colors.dart';
import 'package:tsk_management/screens/add_task.dart';
import 'package:tsk_management/screens/all_task.dart';
import 'package:tsk_management/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/welcome.jpg'),
          )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nStart your beautiful day",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                    ),
                  )
                ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => const AddTask(), transition: Transition.fade, duration: const Duration(microseconds: 500));
              }),
              child: ButtonWidget(
                backgroundcolor: AppColors.mainColor,
                text: "Add Task",
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => const AllTasks(), transition: Transition.fade, duration: const Duration(seconds: 1));
              }),
              child: ButtonWidget(
                backgroundcolor: Colors.white,
                text: "View All",
                textColor: AppColors.smallTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
