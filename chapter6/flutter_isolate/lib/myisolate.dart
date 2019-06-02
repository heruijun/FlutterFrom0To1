import 'dart:async';
import 'dart:isolate';

main() async {
  // isolate所需的参数，必须要有SendPort，SendPort需要ReceivePort来创建
  final receivePort = new ReceivePort();
  // 开始创建isolate, Isolate.spawn函数是isolate.dart里的代码,_isolate是我们自己实现的函数
  await Isolate.spawn(_isolate, receivePort.sendPort);
  // 发送的第一个message，是它的SendPort
  var sendPort = await receivePort.first;
  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

/// 新isolate的入口函数
_isolate(SendPort replyTo) async {
  // 实例化一个ReceivePort 以接收消息
  var port = new ReceivePort();

  // 把它的sendPort发送给宿主isolate，以便宿主可以给它发送消息
  replyTo.send(port.sendPort);

  // 监听消息，从port里取
  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send('应答：' + data);
    if (data == "bar") port.close();
  }
}

/// 对某个port发送消息，并接收结果
Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}