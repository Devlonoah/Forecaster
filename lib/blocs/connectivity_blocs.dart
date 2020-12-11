import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionStateBloc {
  final _connectivity = Connectivity();
  final _connectionController = PublishSubject<ConnectivityResult>();
  final _connectiionEventToString = PublishSubject<String>();

  Stream<ConnectivityResult> get connectState => _connectionController.stream;
  // StreamSink<ConnectivityResult> get changeConnectionState =>
  //     _connectionController.sink;

  Stream<String> get eventInString => _connectiionEventToString.stream;
  StreamSink<String> get changeEventInString => _connectiionEventToString.sink;

  fecthConnectionState() {
    _connectivity.onConnectivityChanged.listen((event) {
      // changeConnectionState.add(event);

      switch (event) {
        case ConnectivityResult.wifi:
          changeEventInString.add('You are connected to Wifi');
          break;
        case ConnectivityResult.mobile:
          changeEventInString.add('You are connected to mobile');
          break;
        case ConnectivityResult.none:
          changeEventInString.add('no internet connection');
          break;
      }

      return event;
    });
  }

  void dispose() {
    _connectionController.close();
    _connectiionEventToString.close();
  }
}
