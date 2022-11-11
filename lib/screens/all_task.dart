import 'package:flutter/material.dart';
import 'package:tsk_management/app_colors.dart';
import 'package:tsk_management/widgets/button_widget.dart';
import 'package:tsk_management/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try Smarter"];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 40),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/header1.jpg'),
              )
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "2",
                  style:
                      TextStyle(fontSize: 20, color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0,),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    onDismissed: (DismissDirection direction) {
                      print('After confirming');
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                              height: 550,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2e3253).withOpacity(0.4),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonWidget(
                                        backgroundcolor: AppColors.mainColor,
                                        text: 'View',
                                        textColor: Colors.white),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ButtonWidget(
                                        backgroundcolor: AppColors.mainColor,
                                        text: 'Edit',
                                        textColor: Colors.blue)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        return false;
                      } else {
                        return Future.delayed(const Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                        text: myData[index],
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
