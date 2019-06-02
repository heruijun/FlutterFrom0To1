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

abstract class CanFixComputer {
  void fixComputer();
}

abstract class CanProgramming {
  void programming();
}

class SoftwareEngineer extends Engineer implements CanFixComputer, CanProgramming {
  @override
  void fixComputer() {
    print('软件工程师修电脑');
  }

  @override
  void programming() {
    print('设计软件');
  }
}

class ITTeacher extends Teacher implements CanFixComputer {
  @override
  void fixComputer() {
    print('IT教师修电脑');
  }
}

main() {
  ITTeacher()
    ..doWork()
    ..fixComputer();

  SoftwareEngineer()
    ..doWork()
    ..fixComputer()
    ..programming();
}