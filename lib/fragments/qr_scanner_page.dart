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
                if (state is MoveQRstate) {
                  Navigator.push(
                      newContext,
                      MaterialPageRoute(
                          builder: (routeContext) => QRscanner(
                                context: routeContext,
                              )));
                }
              },
              builder: (context, state) {
                debugPrint(state.runtimeType.toString());
                if (state is QrInitialState) {
                  return bodyWidget(context, 'Flutter', '');
                } else if (state is QRscannedState) {
                  return bodyWidget(
                      this.context, 'Flutter', state.scannedValue);
                } else if (state is QRgeneratedState) {
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
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: textEditingController,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (textEditingController.text != '') {
                BlocProvider.of<QrBloc>(context)
                    .add(GenerateQRPressedEvent(textEditingController.text));
              }
            },
            child: const Text('Generate QR code')),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<QrBloc>(context).add(ScanQRPressedEvent(context));
            },
            child: const Text('Start QR scan')),
        const SizedBox(
          height: 10,
        ),
        Text(scannedValue),
      ])),
    );
  }

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

// BlocListener<QrBloc, QrState>(
//                 listener: (context, state) {
//                   if (state is QrInitial) {
//                     bodyWidget(context, 'Flutter', '');
//                   } else if (state is MoveQRstate) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (routeContext) => QRscanner(
//                                   context: routeContext,
//                                 )));
//                   } else if (state is QRgenerated) {
//                     bodyWidget(context, state.svgString, '');
//                     print(state.svgString);
//                   } else if (state is QRscanned) {
//                     bodyWidget(context, 'Flutter', state.scannedValue);
//                   } else if (state is QRgenerated) {
//                     bodyWidget(context, state.svgString, '');
//                   } else {
//                     bodyWidget(context, 'Flutter', '');
//                   }
//                 },
//                 child: bodyWidget(context, 'Flutter', ''),
//               )
