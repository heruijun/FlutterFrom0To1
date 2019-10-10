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

  print(list.asMap());        // 把list转换成map类型

  var companies = ['阿里巴巴','今日头条','爱奇艺'];
  print(!companies.isEmpty);
  companies.forEach((company) => print('$company在使用Flutter'));

  var flutterCompanies = companies.map((company) => '$company在使用Flutter');
  flutterCompanies.forEach(print);

  var flutterCompaniesList = companies.map((company) => '$company在使用Flutter').toList();
  print(flutterCompaniesList);

  print(companies.where((company) => company == '阿里巴巴'));     // 返回满足where条件的对象
  print(companies.any((company) => company == '阿里巴巴'));       // 只要存在一个即可
  print(companies.every((company) => company == '阿里巴巴'));     // 除了阿里巴巴，还有今日头条，爱奇艺
}