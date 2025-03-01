// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Service extends GetxController {
  final hasCallsuport = true.obs();

  void initState() {
    super.onInit();
  }

  Future<void> makePhonecall(String phoneNumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      print(e);
    }
  }
}
