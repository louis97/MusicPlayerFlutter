import 'package:flutter/material.dart';

class MusicPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  Duration _current = Duration(milliseconds: 0);
  Duration _songDuration = Duration(milliseconds: 0);

  AnimationController _controller;

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get porcentage => (this._songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  Duration get current => _current;

  set current(Duration value) {
    _current = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  AnimationController get controller => _controller;

  set controller(AnimationController value) {
    _controller = value;
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}