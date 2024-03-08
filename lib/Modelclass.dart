

class EmployApi {
  String status;
  List<Datum> data;
  String message;

  EmployApi({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EmployApi.fromMap(Map<String, dynamic> json) => EmployApi(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "message": message,
  };
}

class Datum {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Datum({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}