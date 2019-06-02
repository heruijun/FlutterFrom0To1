void main() {
  var number;
  number = 15;
  print('小明的年龄是 $number 岁');

  number = '20';  // 注意，变量类型是可以变的
  print(number);

  final c = 30;   // final修饰的变量只能被申明一次
  print(c);
  
  const d = 50;
  print(d);
}