import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../appConst/index.dart';

class ActiveBookingsController extends GetxController {
  var nameController = TextEditingController();
  var referenceRangecontrollre = TextEditingController();
  var testPricecontrollre = TextEditingController();
  var testDescriptioncontrollre = TextEditingController();
  var sampleCollectionInstructioncontrollre = TextEditingController();
  var sampleTypecontrollre = TextEditingController();
  var relevantDiseasescontrollre = TextEditingController();
  var turnaroundTimecontrollre = TextEditingController();
  var isloading = false.obs;
  var searchingText = "".obs;
  getAllBookings() {
    return firebasefirestore.collection(bookingsCollection).snapshots();
  }
 
}
