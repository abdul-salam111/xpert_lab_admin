import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

import '../controllers/upload_reports_controller.dart';

class UploadReportsView extends GetView<UploadReportsController> {
  const UploadReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: darkBlue,
            centerTitle: true,
          ),
          body: Padding(
            padding: padding20,
            child: Center(
              child: SingleChildScrollView(
                physics: bouncing,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: crosscenter,
                  children: [
                    "Enter Details Of Report"
                        .text
                        .fontFamily(montserratBold)
                        .size(25.sp)
                        .color(fullgrey)
                        .make(),
                    30.heightBox,
                    Row(
                      mainAxisAlignment: maincenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                            Label: "Beneficiary Name",
                            texteditingController: controller.nameController,
                          ),
                        ),
                        30.widthBox,
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                              Label: "Gender",
                              texteditingController:
                                  controller.genderController),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: maincenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                            Label: "Test Name",
                            texteditingController:
                                controller.testnameController,
                          ),
                        ),
                        30.widthBox,
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                              Label: "Booking Id",
                              texteditingController:
                                  controller.bookingIdController),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: maincenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                            Label: "Booking Date",
                            texteditingController:
                                controller.bookingDateController,
                          ),
                        ),
                        30.widthBox,
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                              Label: "Booking Time",
                              texteditingController: controller.bookingTime),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: maincenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                            Label: "Phone No",
                            texteditingController: controller.phonecontroller,
                          ),
                        ),
                        30.widthBox,
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                              Label: "Total Bill",
                              texteditingController:
                                  controller.totalBillcontroller),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: maincenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForReportsOnlyRead(
                            Label: "Address",
                            texteditingController: controller.bookingAddress,
                          ),
                        ),
                        30.widthBox,
                        SizedBox(
                          width: 200.w,
                          child: customTextFieldsForTests(
                              hintText: "Additional Remarks",
                              Label: "Additional Comments",
                              texteditingController:
                                  controller.additionalCommentsController),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Add Test Reports"),
                        IconButton(
                            onPressed: () {
                              controller.showreport.value = true;
                            },
                            icon: Icon(Icons.add))
                      ],
                    ),
                    Obx(() => controller.testsreports.isNotEmpty
                        ? SizedBox(
                          height: 400.h,
                          child: ListView.builder(
                              itemCount: controller.testsreports.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.testsreports[index].testname),
                                  subtitle: Text(controller.testsreports[index].testreport),

                                );
                              }),
                        )
                        : SizedBox.shrink()),
                    Obx(
                      () => controller.showreport.value
                          ? SizedBox(
                              width: 400.w,
                              height: 70.h,
                              child: DropdownButtonHideUnderline(
                                
                                child: Obx(
                                  () => DropdownButton2<String>(
                                    isExpanded: true,
                                   
                                    hint:controller.seletedTestslist.isNotEmpty? Text(
                                           controller.seletedTestslist.value,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: fullgrey,
                                                fontFamily: montserratBold),
                                          ):Text(
                                            "Select Tests",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: fullgrey,
                                                fontFamily: montserratBold),
                                          )
                                      ,
                                    items: controller.testList.map((item) {
                                      return DropdownMenuItem<String>(
                                        onTap: () {
                                         controller.seletedTestslist.value=item;
                                          
                                        },
                                        value: item,
                                        child: Row(
                                            children: [
                                             
                                              Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: montserratBold,
                                                  color: fullgrey,
                                                ),
                                              ),
                                            ],
                                          
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      controller.selectedTest.value = value!;
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      height: 40.h,
                                      width: 140.w,
                                    ),
                                  )
                                      .box
                                      .border(color: whitecolor)
                                      .color(verylightgrey)
                                      .roundedSM
                                      .outerShadow
                                      .make(),
                                ),
                              ))
                          : const SizedBox.shrink(),
                    ),
                    20.heightBox,
                    Obx(
                      () => controller.showreport.value
                          ? SizedBox(
                              width: 410.w,
                              child: customTextFieldsForTests(
                                  texteditingController:
                                      controller.uploadReportsController,
                                  Label: "Report results",
                                  hintText: "Enter results here"),
                            )
                          : const SizedBox.shrink(),
                    ),
                    20.heightBox,
                    Obx(
                      () => controller.showreport.value
                          ? Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      controller.showreport.value = false;
                                      controller.testsreports.add(
                                        ReportModel( controller.seletedTestslist.value
                                              .toString(),  controller
                                              .uploadReportsController.text)
                                         
                                         );

                                         controller.uploadReportsController.clear();
                                         controller.seletedTestslist.value="";
                                    },
                                    child: Text("Add to bucket")),
                              ],
                            )
                          : SizedBox.shrink(),
                    ),
                    customButton(
                        onPress: () {
                          var tomaps={};
for (var element in controller.testsreports) {
  tomaps.addEntries([MapEntry(element.testname,element.testreport)]);
}
                          var reports=jsonEncode(tomaps).toString();
                          print(reports);
                          var aftergeting=jsonDecode(reports);
                          print(aftergeting);

                        },
                        btnName: "Upload Reports",
                        bgColor: darkBlue,
                        textcolor: whitecolor,
                        btnSize: Size(100.w, 70.h))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
