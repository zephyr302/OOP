import 'dart:io';

class Student {
  String _name;
  String _age;
  String _course;
  double _gwa;
  String _status = "";

  Student(this._name, this._age, this._course, this._gwa) {
    _updateStatus();
  }

  String get name => _name;
  String get age => _age;
  String get course => _course;
  double get gwa => _gwa;
  String get status => _status;

  set name(String value) => _name = value;
  set age(String value) => _age = value;
  set course(String value) => _course = value;

  set gwa(double value) {
    _gwa = value;
    _updateStatus();
  }

  void _updateStatus() {
    if (_gwa <= 1.75) {
      _status = "Excellent";
    } else if (_gwa <= 2.75) {
      _status = "Very Good";
    } else if (_gwa <= 3.0) {
      _status = "Passed";
    } else {
      _status = "Probation";
    }
  }

  void displayInfo() {
    print("==========STUDENT INFORMATION==========");
    print("Name   : $_name");
    print("Age    : $_age");
    print("Course : $_course");
    print("GWA    : $_gwa");
    print("=======================================");
  }
}

List<Student> students = [];

void main() {
  bool run = true;
  do {
    print("==============================");
    print("STUDENT INFORMATION SYSTEM");
    print("==============================");

    print("0: SEARCH STUDENT");
    print("1: ADD STUDENT");
    print("2: VIEW STUDENT LIST");
    print("3: UPDATE STUDENT INFO");
    print("4: DELETE STUDENT INFO");
    print("5: COMPUTE CLASS AVERAGE");
    print("6: DISPLAY STUDENT WITH HIGHEST GRADE");
    print("7: DISPLAY STUDENT WITH LOWEST GRADE");
    print("8: EXIT");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "0":
        print("Search Student");
        searchStudent();
        break;

      case "1":
        addStudent();
        print("Add Student");
        break;

      case "2":
        print("View Student List");
        viewStudents();
        break;

      case "3":
        print("Update Student Info");
        updateStudent();
        break;

      case "4":
        print("Delete Student");
        deleteStudent();
        break;

      case "5":
        print("Compute Class Average");
        computeAverage();
        break;

      case "6":
        print("Display Student with Highest Grade");
        highestGrade();
        break;

      case "7":
        print("Display Student with Lowest Grade");
        lowestGrade();
        break;

      case "8":
        print("Exit");
        run = false;
        break;

      default:
        print("Invalid");
    }
  } while (run);
}

void addStudent() {
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter your age: ");
  String? age = stdin.readLineSync();

  stdout.write("Enter your course: ");
  String? course = stdin.readLineSync();

  stdout.write("Enter your gwa: ");
  double gwa = double.parse(stdin.readLineSync()!);

  Student student = Student(name!, age!, course!, gwa);
  students.add(student);
  print("Added successfully!");
}

void viewStudents() {
  if (students.isEmpty) {
    print("No student info.");
  } else {
    for (var s in students) {
      s.displayInfo();
    }
  }
}

void searchStudent() {
  stdout.write("Enter name to search: ");
  String? name = stdin.readLineSync();
  bool found = false;

  for (var s in students) {
    if (s.name == name) {
      s.displayInfo();
      found = true;
      break;
    }
  }

  if (!found) {
    print("No student info.");
  }
}

void updateStudent() {
  stdout.write("Enter name to update: ");
  String? name = stdin.readLineSync();
  bool found = false;

  for (var s in students) {
    if (s.name == name) {
      stdout.write("Enter new age: ");
      s.age = stdin.readLineSync()!;
      stdout.write("Enter new course: ");
      s.course = stdin.readLineSync()!;
      stdout.write("Enter new gwa: ");
      s.gwa = double.parse(stdin.readLineSync()!);
      print("Updated successfully!");
      found = true;
      break;
    }
  }

  if (!found) {
    print("No student info.");
  }
}

void deleteStudent() {
  stdout.write("Enter name to delete: ");
  String? name = stdin.readLineSync();
  bool found = false;

  for (int i = 0; i < students.length; i++) {
    if (students[i].name == name) {
      students.removeAt(i);
      print("Deleted successfully!");
      found = true;
      break;
    }
  }

  if (!found) {
    print("No student info.");
  }
}

void computeAverage() {
  if (students.isEmpty) {
    print("No student info.");
    return;
  }

  double total = 0;
  for (var s in students) {
    total += s.gwa;
  }

  double average = total / students.length;
  print("==========CLASS AVERAGE==========");
  print("Class Average GWA: $average");
  print("=================================");
}

void highestGrade() {
  if (students.isEmpty) {
    print("No student info.");
    return;
  }

  double highestGwa = students[0].gwa;
  for (var s in students) {
    if (s.gwa < highestGwa) {
      highestGwa = s.gwa;
    }
  }

  print("Highest Grade Students:");
  for (var s in students) {
    if (s.gwa == highestGwa) {
      s.displayInfo();
    }
  }
}

void lowestGrade() {
  if (students.isEmpty) {
    print("No student info.");
    return;
  }

  double lowestGwa = students[0].gwa;
  for (var s in students) {
    if (s.gwa > lowestGwa) {
      lowestGwa = s.gwa;
    }
  }

  print("Lowest Grade Students:");
  for (var s in students) {
    if (s.gwa == lowestGwa) {
      s.displayInfo();
    }
  }
}
