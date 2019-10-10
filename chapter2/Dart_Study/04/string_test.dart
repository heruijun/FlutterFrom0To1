void main() {
  var str1 = 'Hello';                   // 单引号创建字符串
  var str2 = "Hello2";                  // 双引号创建字符串
  // 三引号创建多行字符串
  var str3 = '''你好
              欢迎光临''';
  var str4 = r'双11真给力';
  var str5 = 'a|b|c|d|e|f|g';
  var str6 = '小学一年级';

  print(str1.toUpperCase());
  print(str2.length);
  print(str3.startsWith('你好'));
  print(str4);
  print(str5.split('|'));
  print(str6.replaceAll('小', '大'));
}