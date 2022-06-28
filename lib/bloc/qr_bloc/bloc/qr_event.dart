part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class ScanQRPressed extends QrEvent {
  BuildContext context;
  ScanQRPressed(this.context);
}

class GenerateQRPressed extends QrEvent {
  BuildContext context;
  String text;
  GenerateQRPressed(this.context, this.text);
}

class QrScannedEvent extends QrEvent {
  String scannedValue;
  QrScannedEvent(this.scannedValue);
}

class QRbackButtonPressed extends QrEvent {}
