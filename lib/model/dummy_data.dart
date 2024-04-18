// To parse this JSON data, do
//
//     final dummyData = dummyDataFromMap(jsonString);

import 'dart:convert';

List<DummyData> dummyDataFromMap(String str) =>
    List<DummyData>.from(json.decode(str).map((x) => DummyData.fromMap(x)));

String dummyDataToMap(List<DummyData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DummyData {
  String employeeName;
  int employeeSalary;
  int employeeAge;

  DummyData({
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
  });

  factory DummyData.fromMap(Map<String, dynamic> json) => DummyData(
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
      );

  Map<String, dynamic> toMap() => {
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
      };
}
