import 'package:diginova/screens/update_screen/update_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiteReadinessController extends GetxController {
  //Update 2 Page
  RxBool isChecked = false.obs;
  RxBool isChecked1 = false.obs;
  RxBool isChecked2 = false.obs;
  RxBool isChecked3 = false.obs;
  RxBool isChecked4 = false.obs;

  void selectYes() {
    isChecked.value = true;
    isChecked1.value = false;
  }

  void selectNo() {
    isChecked.value = false;
    isChecked1.value = true;
  }

  void selectYes1() {
    isChecked2.value = true;
    isChecked3.value = false;
  }

  void selectNo1() {
    isChecked2.value = false;
    isChecked3.value = true;
  }

  //Update 3 Page var
  RxBool boxOne = false.obs;
  RxBool boxTwo = false.obs;
  RxBool boxThree = false.obs;
  RxBool boxFour = false.obs;
  RxBool boxFive = false.obs;
  RxBool boxSix = false.obs;

  //Update 4
  RxBool isChecked_0 = false.obs;
  RxBool isChecked_1 = false.obs;
  RxBool isChecked_2 = false.obs;
  RxBool isChecked_3 = false.obs;
  RxBool isChecked_4 = false.obs;
  RxBool isChecked_5 = false.obs;
  RxBool isChecked_6 = false.obs;
  RxBool isChecked_7 = false.obs;
  RxBool isChecked_8 = false.obs;
  RxBool isChecked_9 = false.obs;
  RxBool isChecked_10 = false.obs;
  RxBool isChecked_11 = false.obs;
  RxBool isChecked_12 = false.obs;
  RxBool isChecked_13 = false.obs;
  RxBool isChecked_14 = false.obs;
  RxBool isChecked_15 = false.obs;

  void selectYes_0() {
    isChecked_0.value = true;
    isChecked_1.value = false;
  }

  void selectNo_0() {
    isChecked_0.value = false;
    isChecked_1.value = true;
  }

  void selectYes_1() {
    isChecked_2.value = true;
    isChecked_3.value = false;
  }

  void selectNo_1() {
    isChecked_2.value = false;
    isChecked_3.value = true;
  }

  void selectYes_2() {
    isChecked_4.value = true;
    isChecked_5.value = false;
  }

  void selectNo_2() {
    isChecked_4.value = false;
    isChecked_5.value = true;
  }

  void selectYes_3() {
    isChecked_6.value = true;
    isChecked_7.value = false;
  }

  void selectNo_3() {
    isChecked_6.value = false;
    isChecked_7.value = true;
  }

  void selectYes_4() {
    isChecked_8.value = true;
    isChecked_9.value = false;
  }

  void selectNo_4() {
    isChecked_8.value = false;
    isChecked_9.value = true;
  }

  void selectYes_5() {
    isChecked_10.value = true;
    isChecked_11.value = false;
  }

  void selectNo_5() {
    isChecked_10.value = false;
    isChecked_11.value = true;
  }

  void openBottomSheet() {
    Get.bottomSheet(
      barrierColor: Colors.transparent,
      Container(
        width: Get.width,
        height: Get.height / 2,
        decoration: const BoxDecoration(
          color: Color(0XFFEDF7FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            itemCount: updateList.length,
            itemBuilder: (context, index) {
              return SiteReadinessCard(
                title: "${updateList[index]['title']} ${index + 1}",
                description: updateList[index]['Description'],
                icons: index == 0
                    ? const Icon(
                        Icons.check_circle_outlined,
                        size: 25,
                        color: Colors.green,
                      )
                    : index == 1
                        ? Image.asset(
                            'assets/icons/inprocess_cercle.png',
                            height: 24,
                            width: 24,
                          )
                        : index == 2
                            ? Image.asset(
                                'assets/icons/edit_cercle.png',
                                height: 24,
                                width: 24,
                              )
                            : index == 3
                                ? Image.asset(
                                    'assets/icons/edit_cercle.png',
                                    height: 24,
                                    width: 24,
                                  )
                                : Container(),
              );
            },
          ),
        ),
      ),
    );
  }
}
