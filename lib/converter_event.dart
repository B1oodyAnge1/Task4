import 'main.dart';

abstract class ConverterEvent extends MyApp {
  const ConverterEvent();
  @override
  List<Object?> get props => [];
}

class OpenMyDocument extends ConverterEvent {
  OpenMyDocument();
}

class ConverterDocument extends ConverterEvent {
  final String? Extension;
  ConverterDocument({required this.Extension});
}

class DownloadDocument extends ConverterEvent {
  final String? Extension;
  DownloadDocument({required this.Extension});
}
