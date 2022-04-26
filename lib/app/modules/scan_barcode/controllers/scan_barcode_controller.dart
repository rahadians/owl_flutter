import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:owl_flutter/app/assets/models/constant.dart';

class ScanBarcodeController extends GetxController {
  RxString qrContentEditingController = "".obs;
  var qrCode = "".obs;

  String scannedQrcode = '';

  TextEditingController qrcodeC = TextEditingController();

  Future<void> scanQR() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Batal', true, ScanMode.QR);

      if (scannedQrcode != "-1") {
        Get.snackbar('Hasil', 'QRCode ' + scannedQrcode,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kLightgreen,
            colorText: Colors.white);
      }
      ;
    } on PlatformException {}
  }

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;
}
