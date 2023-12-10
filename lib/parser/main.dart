import 'AnalyzerResponse.dart';
import 'analyzer.dart';
import 'dart:io';

Future<void> main(List args) async {
  File file = File('input.txt');
  if (!(await file.exists())) {
    print("File Doesn't Exists");
    return;
  }
  String content = """
  CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    DepartmentID INT,
    CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
  """;

  AnalyzerResponse res = Analyzer().analyze(content);

  print("Keywords: ${res.keywords.getKeyword}");
  print("Tables: ${res.tableColumn.getTables}");
  print("Columns: ${res.tableColumn.getColumns}");
  print("Punctuations: ${res.punctuations.get}");
  print("Constants: ${res.constants.getConstants}");
  print("Others: ${res.others}");
}
