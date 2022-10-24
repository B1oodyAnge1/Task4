import 'package:flutter/animation.dart';

import 'main.dart';

class ConverterState extends MyApp {
  final String filePath;
  final String fileName;
  final List<String> listExtensionString;
  const ConverterState({
    this.filePath = '0000',
    this.fileName = ' ',
    this.listExtensionString = const [],
  });
  ConverterState copyWith({
    String? filePath,
    String? fileName,
    List<String>? listExtensionString,
  }) {
    return ConverterState(
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      listExtensionString: listExtensionString ?? this.listExtensionString,
    );
  }

  @override
  List<Object?> get props => [
        filePath,
        fileName,
        listExtensionString,
      ];
}
