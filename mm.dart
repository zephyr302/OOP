import 'dart:io';

List<Map<String, dynamic>> students = [];
int next_id = 1;

void main() {
  while (true) {
    print("================================");
    print("======STUDENT INFORMATION======");
    print("================================");
    print("1: Add Student");
    print("2: View Student");
    print("3: Update Student");
    print("4: Delete Student");
    print("5: Exit");
    print("================================");
    stdout.write("Choose 1-5: ");

    int Choose = int.parse(stdin.readLineSync()!);

    switch (Choose) {
      case 1:
        addStudent();
        break;

      case 2:
        viewStudent();
        break;

      case 3:
        updateStudent();
        break;

      case 4:
        deleteStudent();
        break;

      case 5:
        print("Exit");
        return;
    }
  }
}

void addStudent() {
  print("======Student Add======");
  stdout.write("Enter Student Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Enter Student Course: ");
  String course = stdin.readLineSync()!;

  stdout.write("Enter Student Yearlevel: ");
  String yearlevel = stdin.readLineSync()!;

  students.add({
    "id": next_id,
    "Name": name,
    "Course": course,
    "Year_level": yearlevel,
  });
  print("==Student Added successfully==");
}

void viewStudent() {
  print("Viewing Student");
  if (students.isEmpty) {
    print("not found");
  }
  for (int i = 0; i < students.length; i++) {
    var student = students[i];
    print("Name : ${student['Name']}");
    print("Course : ${student['Course']}");
    print("Year level : ${student['Year_level']}\n");
  }
}

void updateStudent() {
  print("Updating");
  if (students.isEmpty) print("not found");
}

void deleteStudent() {}
