import 'package:flutter/material.dart';
import 'package:plantapp_2/const/constants.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  MobileScannerController cameracontroller = MobileScannerController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // appbar
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
                  // x button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                //like button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    Icons.share,
                    color: Constants.primaryColor,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        MobileScanner(
                          controller: cameracontroller,
                          onDetect: (barcodes) {
                            debugPrint('working...');
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'برای اسکن گیاه کلیک کنید',
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(0.8),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
