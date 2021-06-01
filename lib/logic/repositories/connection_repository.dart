import 'dart:async';
import 'dart:io';

class InternetConnection {
  final oneSec = Duration(seconds: 1);

  InternetConnection() {
    Timer.periodic(oneSec, (timer) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //emit(NetConnectionLoadedState(true));
          _streamController.sink.add(true);
        }
      } on SocketException catch (_) {
        //emit(NetConnectionLoadedState(false));
        _streamController.sink.add(false);
      }
    });
  }

  final _streamController = StreamController<bool>();
  Stream<bool> get stream => _streamController.stream;

  void cancel() {
    _streamController.close();
  }
}