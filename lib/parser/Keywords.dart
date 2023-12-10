class Keywords {
  List<String> keywords = [];
  String ALTER = "ALTER";
  String TABLE = "TABLE";
  String ADD = "ADD";
  String CONSTRAINT = "CONSTRAINT";
  String UNIQUE = "UNIQUE";
  String DROP = "DROP";
  String CREATE = "CREATE";
  String ON = "ON";
  String PRIMARY = "PRIMARY";
  String KEY = "KEY";
  String INT = "INT";
  String VARCHAR = "VARCHAR";
  String DATE = "DATE";
  String FOREIGN = "FOREIGN";
  String REFERENCES = "REFERENCES";
  String INDEX = "INDEX";
  String SCHEMA = "SCHEMA";
  String DATABASE = "DATABASE";

  final List<String> _storeKeywords = [];

  Keywords() {
    keywords.add(ALTER);
    keywords.add(TABLE);
    keywords.add(ADD);
    keywords.add(CONSTRAINT);
    keywords.add(UNIQUE);
    keywords.add(DROP);
    keywords.add(CREATE);
    keywords.add(ON);
    keywords.add(PRIMARY);
    keywords.add(KEY);
    keywords.add(INT);
    keywords.add(VARCHAR);
    keywords.add(DATE);
    keywords.add(FOREIGN);
    keywords.add(REFERENCES);
    keywords.add(INDEX);
    keywords.add(SCHEMA);
    keywords.add(DATABASE);
  }

  bool isKeyword(String s) {
    return keywords.contains(s.toUpperCase());
  }

  void addKeyword(String keyword) {
    String uKeywored = keyword.toUpperCase();
    if (_storeKeywords.contains(uKeywored)) {
      return;
    }
    _storeKeywords.add(keyword);
  }

  List<String> get getKeyword => _storeKeywords;
}
