abstract class Worker {
  void doWork();
}

class Teacher extends Worker {
  void doWork() {
    print("老师在上课");
  }
}

class Engineer extends Worker {
  void doWork() {
    print("工程师在工作");
  }
}

// 软件工程师
class SoftwareEngineer extends Engineer {

}

// 硬件工程师
class HardwareEngineer extends Engineer {

}

// 体育教师
class SportsTeacher extends Teacher {

}

// IT教师
class ITTeacher extends Teacher {

}