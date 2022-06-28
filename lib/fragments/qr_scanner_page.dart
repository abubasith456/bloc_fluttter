import 'dart:io';
import 'dart:math';
import 'package:bloc_flutter/bloc/qr_bloc/bloc/qr_bloc.dart';
import 'package:bloc_flutter/fragments/qr_Scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../navidation_drawer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRscannerPage extends StatefulWidget {
  QRscannerPage({Key? key}) : super(key: key);

  static const String routeName = '/qrScannerPage';

  @override
  State<QRscannerPage> createState() => _QRscannerPageState();
}

class _QRscannerPageState extends State<QRscannerPage> {
  // late String barcode;
  MobileScannerController mobileScannerController = MobileScannerController();
  TextEditingController textEditingController = TextEditingController();
  String scannedValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          drawer: NavigationDrawer(),
          appBar: AppBar(title: const Text('QR scanner')),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: BlocConsumer<QrBloc, QrState>(
              listener: (newContext, state) {
                if (state is QrInitial) {
                  bodyWidget(context, 'Flutter', '');
                } else if (state is MoveQRstate) {
                  Navigator.push(
                      newContext,
                      MaterialPageRoute(
                          builder: (routeContext) => QRscanner(
                                context: routeContext,
                              )));
                } else if (state is QRgenerated) {
                  bodyWidget(context, state.svgString, '');
                }
              },
              builder: (context, state) {
                if (state is QrInitial) {
                  return bodyWidget(context, 'Flutter', '');
                } else if (state is QRscanned) {
                  return bodyWidget(context, 'Flutter', state.scannedValue);
                } else if (state is QRgenerated) {
                  return bodyWidget(context, state.svgString, '');
                } else {
                  return bodyWidget(context, 'Flutter', '');
                }
              },
            ),
          )),
    );
  }

  Widget bodyWidget(BuildContext context, String? svg, String scannedValue) {
    return SingleChildScrollView(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 200,
          height: 200,
          child: QrImage(
            data: svg!,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: textEditingController,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (textEditingController.text != '') {
                print('Clicked');
                BlocProvider.of<QrBloc>(context).onEvent(
                    GenerateQRPressed(context, textEditingController.text));
              }
            },
            child: const Text('Generate QR code')),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<QrBloc>(context).add(ScanQRPressed(context));
            },
            child: const Text('Start QR scan')),
        const SizedBox(
          height: 10,
        ),
        Text(scannedValue),
      ])),
    );
  }

  // generateQRsvg(String text) {
  //   final dm = barcode.Barcode.fromType(barcode.BarcodeType.QrCode);
  //   //Generate SVG
  //   final svg = dm.toSvg(text, width: 200, height: 200);

  //   return File('barcode.svg').writeAsString(svg);
  // }

  // Expanded(
  //     flex: 5,
  //     child: TextButton(
  //       child: Text('Click to check'),
  //       onPressed: () => {},
  //     )

  //     // QRView(
  //     //   key: qrKey,
  //     //   onQRViewCreated: _onQRViewCreated,
  //     // ),
  //     ),
  // Expanded(
  //   flex: 1,
  //   child: Center(
  //     child: (result != null)
  //         ? Text(
  //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
  //         : Text('Scan a code'),
  //   ),
  // )

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
