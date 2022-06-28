part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitial extends QrState {}

class MoveQRstate extends QrState {}

class QRscanned extends QrState {
  String scannedValue;
  QRscanned(this.scannedValue);
}

class QRgenerated extends QrState {
  String svgString;
  QRgenerated(this.svgString);
}
