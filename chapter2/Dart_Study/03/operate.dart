void main() {
  var a = 15;
  var b = 10;

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);

  print(a.isEven);    // 判断是否是偶数
  print(a.isOdd);     // 判断是否是奇数
  print(b.isEven);
  print(b.isOdd);

  var c = 1.23;
  
  print(c.floor());
  print(c.round());
  print(c.floor());
  print(c.ceil());
  print(c.toInt());
}