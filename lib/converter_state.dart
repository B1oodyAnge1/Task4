import 'main.dart';

class ConverterState extends MyApp {
  final String filePath;
  final String fileName;
  final int historyLength;
  final Map<int, String> historyExtension;
  final Map<int, String> historyName;
  final Map<int, String> historyUrl;
  final List<String> listExtensionString;
  final Map<int, String> historyTime;
  const ConverterState({
    this.filePath = '0000',
    this.fileName = ' ',
    this.listExtensionString = const [],
    this.historyLength = 0,
    this.historyExtension = const {},
    this.historyName = const {},
    this.historyUrl = const {},
    this.historyTime = const {},
  });
  ConverterState copyWith({
    String? filePath,
    String? fileName,
    int? historyLength,
    Map<int, String>? historyExtension,
    Map<int, String>? historyName,
    Map<int, String>? historyUrl,
    Map<int, String>? historyTime,
    List<String>? listExtensionString,
  }) {
    return ConverterState(
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      historyLength: historyLength ?? this.historyLength,
      historyExtension: historyExtension ?? this.historyExtension,
      historyName: historyName ?? this.historyName,
      historyUrl: historyUrl ?? this.historyUrl,
      historyTime: historyTime ?? this.historyTime,
      listExtensionString: listExtensionString ?? this.listExtensionString,
    );
  }

  @override
  List<Object?> get props => [
        filePath,
        fileName,
        historyLength,
        historyExtension,
        historyName,
        historyUrl,
        historyTime,
        listExtensionString,
      ];
}
