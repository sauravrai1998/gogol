import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/banner_model.dart';

class HomeController extends GetxController {
  late DatabaseReference _databaseReference;

  final dataList = <Banner>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize database reference
    _databaseReference = FirebaseDatabase.instance.ref('flamelink/environments/production/content/banners/en-US');

    // Listen for data changes
    _databaseReference.onValue.listen((event) {
      print(event.snapshot.value);
      // var data = Banner.fromJson((event.snapshot.value) as Map<String, dynamic>);
      // dataList.add(data);
    });

    // _databaseReference?.onChildChanged.listen((event) {
    //   var data = Banner.fromJson(event.snapshot.value);
    //   var index = dataList.indexWhere((item) => item.key == data.key);
    //   if (index != -1) {
    //     dataList[index] = data;
    //   }
    // });
    //
    // _databaseReference?.onChildRemoved.listen((event) {
    //   var data = Banner.fromJson(event.snapshot.value);
    //   dataList.removeWhere((item) => item.key == data.key);
    // });
  }
}
