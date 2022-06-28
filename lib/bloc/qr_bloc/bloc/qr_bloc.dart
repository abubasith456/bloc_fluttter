import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/fragments/qr_Scanner.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitialState()) {
    on<QrEvent>((event, emit) {
      if (event is ScanQRPressedEvent) {
        emit(MoveQRstate());
      } else if (event is QrScannedEvent) {
        emit(QRscannedState(event.scannedValue));
      } else if (event is QRbackButtonPressedEvent) {
        emit(QrInitialState());
      } else if (event is GenerateQRPressedEvent) {
        emit(QRgeneratedState(event.text));
      }
    });
  }
}
