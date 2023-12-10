import 'package:lexical_parser_ddl/parser/table_column.dart';
import './punctuation.dart';
import 'Keywords.dart';
import 'constants.dart';

class AnalyzerResponse {
  final Keywords keywords;
  final Punctuation punctuations;
  final TableColumn tableColumn;
  final List others;
  final Constants constants;
  AnalyzerResponse({
    required this.keywords,
    required this.punctuations,
    required this.tableColumn,
    required this.others,
    required this.constants,
  });
}
