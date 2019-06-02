import 'dart:async';

void main() {
  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 3'));

  new Future.delayed(
      new Duration(seconds: 1), () => print('future #1 delayed'));

  new Future(() => print('future #2 of 4'))
      .then((_) => print('future #2a'))
      .then((_) {
    print('future #2b');
    scheduleMicrotask(() => print('microtask #0 from future #2b'));
  })
      .then((_) => print('future #2c'))
      .then((_) => print('future #2d'));

  scheduleMicrotask(() => print('microtask #2 of 3'));

  new Future(() => print('future #3 of 4'))
      .then((_) => new Future(() => print('future #3a a new future')))
      .then((_) => print('future #3b'))
      .then((_) => print('future #3c'));

  new Future(() => print('future #4 of 4'))
      .then((_) {
    new Future(() => print('future #4a'));
  })
      .then((_) => print('future #4b'))
      .then((_) => print('future #4c'));

  scheduleMicrotask(() => print('microtask #3 of 3'));

  print('main #2 of 2');
}