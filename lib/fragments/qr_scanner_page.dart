import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../util/qrScanner.dart' as scanner;
// import 'package:qr_code_scanner/qr_code_scanner.dart'

import '../navidation_drawer.dart';

class QRscannerPage extends StatefulWidget {
  QRscannerPage({Key? key}) : super(key: key);

  static const String routeName = '/qrScannerPage';
  //  String photoScanResult = await scanner.scanPhoto();

  @override
  State<QRscannerPage> createState() => _QRscannerPageState();
}

String _scanBarcode = 'Unknown';

class _QRscannerPageState extends State<QRscannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // Barcode? result;
  // QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // controller!.pauseCamera();
    } else if (Platform.isIOS) {
      // controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: TextButton(
                child: Text('Click to check'),
                onPressed: () => {},
              )

              // QRView(
              //   key: qrKey,
              //   onQRViewCreated: _onQRViewCreated,
              // ),
              ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: (result != null)
          //         ? Text(
          //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         : Text('Scan a code'),
          //   ),
          // )
        ],
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
}
