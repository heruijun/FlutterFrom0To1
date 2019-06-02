abstract class CanFixComputer {
  factory CanFixComputer._() {
    return null;
  }

  void fixComputer() {
    print('软件工程师修电脑');
  }
}

abstract class CanProgramming {
  factory CanProgramming._() {
    return null;
  }

  void programming() {
    print('码农正在写代码');
  }
}

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

class SoftwareEngineer extends Engineer with CanFixComputer, CanProgramming {
  @override
  void fixComputer() {
    print('软件工程师修电脑');
  }

  @override
  void programming() {
    print('码农正在写代码');
  }
}

class ITTeacher extends Teacher with CanFixComputer {
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