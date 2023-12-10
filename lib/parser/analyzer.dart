import './constants.dart';
import 'AnalyzerResponse.dart';
import 'Keywords.dart';
import 'functions.dart';
import 'operator.dart';
import 'punctuation.dart';
import 'table_column.dart';
import 'tokanization.dart';

class Analyzer {
  static Keywords keyword = Keywords();
  static Punctuation punctuation = Punctuation();
  static Constants constants = Constants();
  // static Functions function = Functions();
  // static Operator operator = Operator();
  List others = [];
  static TableColumn tableColumn = TableColumn();
  AnalyzerResponse analyze(String s) {
    reset();
    List tokens = Tokanization().createTokens(s);
    print("Tokens Here: $tokens");
    bool isTableIndicatorApperared = false;
    for (String element in tokens) {
      if (keyword.isKeyword(element)) {
        if (element == keyword.TABLE) {
          isTableIndicatorApperared = true;
        }
        keyword.addKeyword(element);
      } else if (punctuation.isPunctuation(element)) {
        punctuation.add(element);
      } else if (tableColumn.isNameValid(element)) {
        if (isTableIndicatorApperared) {
          tableColumn.addTable(element);
          isTableIndicatorApperared = false;
        } else {
          tableColumn.addColumn(element);
        }
      } else if (constants.isConstant(element)) {
        constants.addConstant(element);
      } else {
        others.add(element);
      }
    }
    return AnalyzerResponse(
      keywords: keyword,
      punctuations: punctuation,
      tableColumn: tableColumn,
      others: others,
      constants: constants,
    );
  }

  void reset() {
    keyword = Keywords();
    punctuation = Punctuation();
    constants = Constants();
    tableColumn = TableColumn();
  }
}
