import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class ReportModel{
  final testname,testreport;

  ReportModel(this.testname, this.testreport);

}
class UploadReportsController extends GetxController {
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var testnameController = TextEditingController();
  var bookingDateController = TextEditingController();
  var bookingAddress = TextEditingController();
  var bookingTime = TextEditingController();
  var totalBillcontroller = TextEditingController();
  var bookingIdController = TextEditingController();
  var additionalCommentsController = TextEditingController();
  var uploadReportsController = TextEditingController();
  var phonecontroller = TextEditingController();

  QueryDocumentSnapshot? queryDocumentSnapshot;
 var seletedTestslist = "".obs;
  var ischecked = false.obs;
  var selectedTest = "Select tests".obs;
  RxList testList = [].obs;
  var testsreports=<ReportModel>[].obs;
  var showreport=false.obs;
  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    queryDocumentSnapshot=Get.arguments as QueryDocumentSnapshot;
     nameController.text = queryDocumentSnapshot!['added_By_Name'];
    bookingAddress.text = queryDocumentSnapshot!['booked_By_Address'];
    totalBillcontroller.text = queryDocumentSnapshot!['totalBill'];
    bookingIdController.text = queryDocumentSnapshot!['testBookingId'];
    bookingTime.text = queryDocumentSnapshot!['bookingTime'];
    bookingDateController.text = DateFormat.yMEd()
        .format(DateTime.parse(queryDocumentSnapshot!['bookingDate']));
    phonecontroller.text = queryDocumentSnapshot!['booked_By_Phone'];
    genderController.text = queryDocumentSnapshot!['gender'];
    testList.value=queryDocumentSnapshot!['testNames'];
  }

  @override
  void onClose() {
    // 
    //TODO: implement onClose
    testList.clear();
    super.onClose();
  }
}
