void main() {
  var list = ['one', 'two', 'three'];

  print(list.length);         // 获取长度

  list.add('four');           // 增加一个元素
  print(list);

  list.remove('two');         // 移除一个元素
  print(list);

  list.insert(1, 'two');      // 在指定位置插入一个元素
  print(list);

  print(list.indexOf('one')); // 获取元素所在位置

  print(list.sublist(2));     // 去除前2个元素，并返回一个新的List

  list.forEach(print);        // 传入一个方法

  list.shuffle();             // 随机打乱List里元素的顺序
  print(list);
}