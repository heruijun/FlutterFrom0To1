void main() {
  var game = {"name": "Switch", "company": "任天堂"};
  print(game);

  print(game['name']);
 
  game['price'] = '2500RMB';

  print(game.containsKey('name'));

  var keys = game.keys;
  print(keys);
  print(keys.length == 3);
  print(new Set.from(keys).contains('name'));

  var values = game.values;
  print(values);
  print(values.length == 3);
  print(values.any((v) => v.contains('Switch')));

  var movies = {1: '疯狂的外星人', 2: '流浪地球', 3: '动物世界'};
  movies.forEach((k, v) {
    print('电影排行榜第$k名：$v');
  });
}