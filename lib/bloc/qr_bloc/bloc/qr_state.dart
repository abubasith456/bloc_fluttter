// ignore_for_file: must_be_immutable

part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitialState extends QrState {}

class MoveQRstate extends QrState {}

class QRscannedState extends QrState {
  String scannedValue;
  QRscannedState(this.scannedValue);
}

class QRgeneratedState extends QrState {
  String svgString;
  QRgeneratedState(this.svgString);
}
