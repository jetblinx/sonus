import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sonus/logic/repositories/connection_repository.dart';

class NetConnectionCubit extends Cubit<bool> {
  InternetConnection internetConnection;

  NetConnectionCubit() : super(true) {
    Stream<bool> stream = InternetConnection().stream;
    internetListen(stream);
  }

  StreamSubscription<bool> internetListen(Stream<bool> stream) {
    return stream.listen((event) {
      if (event != state) {
        emit(!state);
      }
  });
  }
}
