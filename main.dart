import 'dart:io';

List<Map<String, dynamic>> students = [];

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

  students.add({"name": name, "age": age, "course": course, "gwa": gwa});
  print("Added successfully!");
}

void viewStudents() {
  if (students.isEmpty) {
    print("No student info.");
  } else {
    for (var s in students) {
      print("==========STUDENT INFORMATION==========");
      print("Name   : ${s['name']}");
      print("Age    : ${s['age']}");
      print("Course : ${s['course']}");
      print("GWA    : ${s['gwa']}");
      print("=======================================");
    }
  }
}

void searchStudent() {
  stdout.write("Enter name to search: ");
  String? name = stdin.readLineSync();
  var found = students.where((s) => s['name'] == name).toList();
  if (found.isEmpty) {
    print("No student info.");
  } else {
    for (var s in found) {
      print("==========STUDENT INFORMATION==========");
      print("Name   : ${s['name']}");
      print("Age    : ${s['age']}");
      print("Course : ${s['course']}");
      print("GWA    : ${s['gwa']}");
      print("=======================================");
    }
  }
}

void updateStudent() {
  stdout.write("Enter name to update: ");
  String? name = stdin.readLineSync();
  for (var s in students) {
    if (s['name'] == name) {
      stdout.write("Enter new age: ");
      s['age'] = stdin.readLineSync();
      stdout.write("Enter new course: ");
      s['course'] = stdin.readLineSync();
      stdout.write("Enter new gwa: ");
      s['gwa'] = double.parse(stdin.readLineSync()!);
      print("Updated successfully!");
      return;
    }
  }
  print("No student info.");
}

void deleteStudent() {
  stdout.write("Enter name to delete: ");
  String? name = stdin.readLineSync();
  students.removeWhere((s) => s['name'] == name);
  print("Deleted successfully!");
}

void computeAverage() {
  if (students.isEmpty) {
    print("No student info.");
    return;
  }
  double total = 0;
  for (var s in students) {
    total += s['gwa'];
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

  double highestGwa = students[0]['gwa'];
  for (var s in students) {
    if (s['gwa'] < highestGwa) {
      highestGwa = s['gwa'];
    }
  }

  print("Highest Grade Students:");
  for (var s in students) {
    if (s['gwa'] == highestGwa) {
      print("==========STUDENT INFORMATION==========");
      print("Name   : ${s['name']}");
      print("Age    : ${s['age']}");
      print("Course : ${s['course']}");
      print("GWA    : ${s['gwa']}");
      print("=======================================");
    }
  }
}

void lowestGrade() {
  if (students.isEmpty) {
    print("No student info.");
    return;
  }

  double lowestGwa = students[0]['gwa'];
  for (var s in students) {
    if (s['gwa'] > lowestGwa) {
      lowestGwa = s['gwa'];
    }
  }

  print("Lowest Grade Students:");
  for (var s in students) {
    if (s['gwa'] == lowestGwa) {
      print("==========STUDENT INFORMATION==========");
      print("Name   : ${s['name']}");
      print("Age    : ${s['age']}");
      print("Course : ${s['course']}");
      print("GWA    : ${s['gwa']}");
      print("=======================================");
    }
  }
}
