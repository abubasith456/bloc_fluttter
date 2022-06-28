import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/fragments/qr_Scanner.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<QrEvent>((event, emit) {
      if (event is GenerateQRPressed) {
        emit(QRgenerated(event.text));
      } else if (event is ScanQRPressed) {
        emit(MoveQRstate());
      } else if (event is QrScannedEvent) {
        emit(QRscanned(event.scannedValue));
      } else if (event is QRbackButtonPressed) {
        emit(QrInitial());
      }
    });
  }
}
