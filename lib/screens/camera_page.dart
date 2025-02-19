import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plantapp_2/const/constants.dart';
import 'package:plantapp_2/screens/qr_overley.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  MobileScannerController cameraController = MobileScannerController();
  late ValueNotifier<bool> torchStateNotifier = ValueNotifier(false);

  void toggleTorch() {
    setState(() {
      bool currentState = torchStateNotifier.value;
      torchStateNotifier.value = !currentState; // تغییر وضعیت فلش
    });
    cameraController.toggleTorch(); // فعال یا غیرفعال کردن فلش
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (BarcodeCapture barcodeCapture) {
              final barcode = barcodeCapture.barcodes.first;
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withValues(alpha: 0.5)),
          // AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withValues(alpha: 0.2),
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                // Torch Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withValues(alpha: 0.2),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: ValueListenableBuilder<bool>(
                      valueListenable:
                          torchStateNotifier, // استفاده از ValueListenableNotifier برای وضعیت فلش
                      builder: (context, isTorchOn, child) {
                        return Icon(
                          isTorchOn ? Icons.flash_on : Icons.flash_off,
                          color: isTorchOn ? Colors.yellow : Colors.white,
                        );
                      },
                    ),
                    onPressed: () {
                      // تغییر وضعیت فلش
                      bool currentState = torchStateNotifier.value;
                      torchStateNotifier.value = !currentState; // تغییر وضعیت
                      cameraController.toggleTorch(); // روشن یا خاموش کردن فلش
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
