import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../controllers/scan_barcode_controller.dart';

class ScanBarcodeView extends GetView<ScanBarcodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScanBarcodeView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => QrImage(
                      size: 200,
                      foregroundColor: Colors.purple,
                      data: controller.qrCode.value,
                    )),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.qrcodeC,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (val) {
                    controller.qrCode.value = val;
                  },
                )
              ],
            ),
          ),
        ));
  }
}
