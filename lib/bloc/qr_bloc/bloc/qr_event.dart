part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class ScanQRPressedEvent extends QrEvent {
  BuildContext context;
  ScanQRPressedEvent(this.context);
}

class GenerateQRPressedEvent extends QrEvent {
  String text;
  GenerateQRPressedEvent(this.text);
}

class QrScannedEvent extends QrEvent {
  String scannedValue;
  QrScannedEvent(this.scannedValue);
}

class QRbackButtonPressedEvent extends QrEvent {}
