import 'package:bloc_flutter/bloc/qr_bloc/bloc/qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../util/flutter_overlay.dart';

class QRscanner extends StatelessWidget {
  BuildContext context;
  QRscanner({required this.context, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MobileScannerController mobileScannerController = MobileScannerController();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<QrBloc>(this.context)
                    .add(QRbackButtonPressed());
                Navigator.pop(context);
              }),
          title: const Text('Scann QR'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            MobileScanner(
              allowDuplicates: false,
              controller: mobileScannerController,
              onDetect: (barcode, args) {
                BlocProvider.of<QrBloc>(this.context)
                    .add(QrScannedEvent(barcode.rawValue!));

                Navigator.pop(context);
              },
            ),
            QRScannerOverlay(
              overlayColour: Colors.black.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
