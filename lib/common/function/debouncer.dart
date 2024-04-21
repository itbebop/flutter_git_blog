import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? _timer;
  Debouncer({required this.delay});

  run(action) {
    // 이미 기다리고 있었다면 타이머를 초기화
    if (_timer != null) {
      _timer!.cancel();
    }
    // 지정된 시간이 지나면 action을 실행
    _timer = Timer(delay, action);
  }
}
