import 'dart:io';

List<Map<String, dynamic>> Student = [];
int next_id = 0;

void main() {
  bool run = true;
  while (run) {
    print("======================================");
    print("===== STUDENT INFORMATION SYSTEM =====");
    print("======================================");
    print("1. Add Student");
    print("2. View Students");
    print("3. Update Student");
    print("4. Delete Student");
    print("5. Exit");
    print("======================================");
    stdout.write("Choose from 1-5: ");

    int choose = int.parse(stdin.readLineSync()!);

    switch (choose) {
      case 1:
        addStudent();
        print(" ");
        break;

      case 2:
        viewStudents();
        print(" ");
        break;

      case 3:
        updateStudent();
        print(" ");
        break;

      case 4:
        deleteStudent();
        print(" ");
        break;

      case 5:
        print("Exiting Program");
        return;
    }
  }
}

void addStudent() {
  print("\n=====Add Student Info=====");
  stdout.write("Enter Student Name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter Student Course: ");
  String? course = stdin.readLineSync();
  stdout.write("Enter Student Year Level: ");
  String? yearlvl = stdin.readLineSync();
  print(" ");
  print("Student Added Successfully");

  Student.add({
    "Id": next_id += 1,
    "Name": name,
    "Course": course,
    "YearLevel": yearlvl,
  });
}

void viewStudents() {
  if (Student.isEmpty) {
    print("No Record Found");
    return;
  }
  print("\n=====Student List=====");
  for (int i = 0; i < Student.length; i++) {
    var students = Student[i];
    print("ID: ${students["Id"]}");
    print("Name: ${students["Name"]}");
    print("Course: ${students["Course"]}");
    print("Year Level: ${students["YearLevel"]}");
    print("========================");
  }
}

void updateStudent() {
  if (Student.isEmpty) {
    print("No Student Found");
    return;
  }

  print("\n===== Update Student =====");
  stdout.write("Enter Student ID to update: ");
  int searchId = int.parse(stdin.readLineSync()!);

  int index = -1;
  for (int i = 0; i < Student.length; i++) {
    if (Student[i]["Id"] == searchId) {
      index = i;
      break;
    }
  }

  if (index == -1) {
    print("Student with ID $searchId not found");
    return;
  }

  print("\nCurrent Student Information:");
  print("Name: ${Student[index]["Name"]}");
  print("Course: ${Student[index]["Course"]}");
  print("Year Level: ${Student[index]["YearLevel"]}");
  print("\nEnter new information (press Enter to keep current value):");

  stdout.write("Enter new name (${Student[index]["Name"]}): ");
  String? newName = stdin.readLineSync();
  if (newName != null && newName.isNotEmpty) {
    Student[index]["Name"] = newName;
  }

  stdout.write("Enter new course (${Student[index]["Course"]}): ");
  String? newCourse = stdin.readLineSync();
  if (newCourse != null && newCourse.isNotEmpty) {
    Student[index]["Course"] = newCourse;
  }

  stdout.write("Enter new year level (${Student[index]["YearLevel"]}): ");
  String? newYearLvl = stdin.readLineSync();
  if (newYearLvl != null && newYearLvl.isNotEmpty) {
    Student[index]["YearLevel"] = newYearLvl;
  }

  print("\nStudent Updated Successfully!");
  updateLog("Updated", searchId);
}

void deleteStudent() {
  if (Student.isEmpty) {
    print("No Student Found");
    return;
  }

  print("\n=====Delete Student=====");
  stdout.write("Enter Student ID to delete: ");
  int searchId = int.parse(stdin.readLineSync()!);

  int index = -1;
  for (int i = 0; i < Student.length; i++) {
    if (Student[i]["Id"] == searchId) {
      index = i;
      break;
    }
  }

  if (index == -1) {
    print("Student with ID $searchId not found");
    return;
  }

  print("\nStudent to delete:");
  print("ID: ${Student[index]["Id"]}");
  print("Name: ${Student[index]["Name"]}");
  print("Course: ${Student[index]["Course"]}");
  print("Year Level: ${Student[index]["YearLevel"]}");

  stdout.write("\nAre you sure you want to delete this student? (y/n): ");
  String? confirmation = stdin.readLineSync();

  if (confirmation != null && confirmation.toLowerCase() == 'y') {
    Student.removeAt(index);
    print("\nStudent Deleted Successfully!");
    updateLog("Deleted", searchId);
  } else {
    print("\nDeletion cancelled.");
  }
}

void updateLog(String action, int studentId) {
  print("Log: Student $action (ID: $studentId) at ${DateTime.now()}");
}
