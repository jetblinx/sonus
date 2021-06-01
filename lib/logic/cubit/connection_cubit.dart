import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

part 'connection_state.dart';

class NetConnectionCubit extends Cubit<NetConnectionState> {
  InternetConnection internetConnection;

  NetConnectionCubit() : super(NetConnectionLoading()) {
    Stream<bool> stream = InternetConnection().stream;
    stream.listen((event) {
      print(event);
      emit(NetConnectionLoadedState(event));
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

// import 'package:bloc/bloc.dart';
// import 'dart:io';

// class ConnectionCubit extends Cubit<bool> {
//   ConnectionCubit() : super(null);

//   void check() async {
//     try {
//       final result = await InternetAddress.lookup('example.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         emit(true);
//       }
//     } on SocketException catch (_) {
//       emit(false);
//     }
//   }
// }
