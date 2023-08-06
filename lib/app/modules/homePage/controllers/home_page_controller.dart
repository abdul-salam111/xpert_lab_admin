import 'package:get/get.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

class HomePageController extends GetxController {
 RxInt totalUsers=0.obs;
 @override
  void onReady()async {
    // TODO: implement onReady
    super.onReady();
    totalUsers.value=await firebasefirestore.collection(userCollection).snapshots().length;
    print(totalUsers.value.toString());
  }
}
