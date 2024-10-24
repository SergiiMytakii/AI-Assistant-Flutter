import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';

List<Map<String, String>> csvToMap(Uint8List fileBytes) {
  final csvString = utf8.decode(fileBytes);
  // Use CsvToListConverter with proper configurations
  final rows = const CsvToListConverter()
      .convert(csvString, eol: '\r\n', fieldDelimiter: ',', textDelimiter: '"');

  final headers = rows.first.cast<String>(); // Extract headers
  final csvData = <Map<String, String>>[];

  for (var row in rows.skip(1)) {
    if (row.isNotEmpty) {
      final rowMap = <String, String>{};
      for (var i = 0; i < headers.length; i++) {
        rowMap[headers[i].toLowerCase()] = row[i]?.toString() ?? '';
      }
      csvData.add(rowMap);
    }
  }

  return csvData;
}
