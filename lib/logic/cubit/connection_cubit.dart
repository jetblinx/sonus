import 'dart:async';

import 'package:bloc/bloc.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';

part 'connection_state.dart';

class NetConnectionCubit extends Cubit<bool> {
  InternetConnection internetConnection;

  NetConnectionCubit() : super(false) {
    Stream<bool> stream = InternetConnection().stream;
    internetListen(stream);
  }

  StreamSubscription<bool> internetListen(Stream<bool> stream) {
    return stream.listen((event) {
      if (event != state) {
        print(event);
        emit(!state);
      }
  });
  }
}

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
